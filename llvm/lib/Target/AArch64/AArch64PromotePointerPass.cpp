//==-- AArch64PromotePointer.cpp -- Upgrade ILP32 IR to 64-bit pointers ----==//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// FIXME: Wibble
//
// ===---------------------------------------------------------------------===//

#include "AArch64.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/PostOrderIterator.h"
#include "llvm/IR/DIBuilder.h"
//#include "llvm/IR/Dominators.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"

using namespace llvm;

#define DEBUG_TYPE "aarch64-promote-pointer"

//===----------------------------------------------------------------------===//
//                       AArch64PromotePointer
//===----------------------------------------------------------------------===//

namespace llvm {
void initializeAArch64PromotePointerPass(PassRegistry &);
}

namespace {

  struct PointerPromoter : InstVisitor<PointerPromoter, bool> {
  DenseMap<Value *, Value *> PointerMap;
  DenseMap<PHINode *, PHINode *> PHIMap;

  IRBuilder<> Builder;
  DIBuilder DIBuilder;
  SmallVector<Instruction *, 10> InstsToRemove;

    PointerPromoter(LLVMContext &Ctx, Module &M) : Builder(Ctx), DIBuilder(M) {}

  Type *getPromotedType(Type *Ty) {
    assert(cast<PointerType>(Ty)->getAddressSpace() == 0);
    return PointerType::get(cast<PointerType>(Ty)->getElementType(), 1);
  }

  Type *getDemotedType(Type *Ty) {
    assert(cast<PointerType>(Ty)->getAddressSpace() == 1);
    return PointerType::get(cast<PointerType>(Ty)->getElementType(), 0);
  }

  Value *promotePointer(Value *V) {
    return Builder.CreateAddrSpaceCast(V, getPromotedType(V->getType()));
  }

  Value *getPromotedPointer(Value *V) {
    if (Constant *C = dyn_cast<Constant>(V))
      return ConstantExpr::getAddrSpaceCast(C, getPromotedType(C->getType()));

    return PointerMap[V];
  }

  // FIXME: why are promtoePointer and demotePointer asymmetric?
  Value *demotePointer(Value *V) {
    // Constants are invariant under promtoe/demote
    if (Constant *C = dyn_cast<Constant>(V))
      return V;

    V = PointerMap[V];
    return Builder.CreateAddrSpaceCast(V, getDemotedType(V->getType()));
  }

  void replaceWith(Instruction *Old, Value *New) {
    if (New->getType()->isPointerTy()) {
      PointerMap[Old] = New;
      InstsToRemove.push_back(Old);
    } else {
      Old->replaceAllUsesWith(New);
      Old->eraseFromParent();
    }
  }

  void insertBefore(Instruction &I) {
    Builder.SetInsertPoint(&I);
  }

  void insertAfter(Instruction &I) {
    Builder.SetInsertPoint(I.getParent(), std::next(BasicBlock::iterator(I)));
  }

  bool visitFunctionArgs(Function &F) {
    bool Changed = false;
    Builder.SetInsertPoint(&*F.getEntryBlock().getFirstInsertionPt());
    for (auto &Arg : F.args()) {
      if (!Arg.getType()->isPointerTy())
        continue;
      Changed = true;
      PointerMap[&Arg] = promotePointer(&Arg);
    }
    return Changed;
  }

  bool visitInstruction(Instruction &I) {
    return false;
  }

  bool visitReturnInst(ReturnInst &RI) {
    Value *RetV = RI.getReturnValue();
    if (!RetV || !RetV->getType()->isPointerTy())
      return false;

    insertBefore(RI);
    Builder.CreateRet(demotePointer(RetV));
    RI.eraseFromParent();
    return true;
  }

  bool visitIndirectBrInst(IndirectBrInst &I) {
    insertBefore(I);
    // FIXME: should we trunc????????????????
    Builder.CreateIndirectBr(getPromotedPointer(I.getAddress()));
    I.eraseFromParent();
    return true;
  }

  // FIXME: resume, catchswitch, catchret, cleanupret
  // FIXME: vector of pointers????

  bool visitExtractValueInst(ExtractValueInst &EI) {
    if (!EI.getType()->isPointerTy())
      return false;

    insertAfter(EI);
    PointerMap[&EI] = promotePointer(&EI);
    return true;
  }

  bool visitInsertValueInst(InsertValueInst &II) {
    Value *Ins = II.getInsertedValueOperand();
    if (!Ins->getType()->isPointerTy())
      return false;

    insertBefore(II);
    Value *NewII =
        Builder.CreateInsertValue(II.getAggregateOperand(), demotePointer(Ins),
                                  II.getIndices(), II.getName());
    replaceWith(&II, NewII);
    return true;
  }

  bool visitAllocaInst(AllocaInst &AI) {
    insertAfter(AI);
    PointerMap[&AI] = promotePointer(&AI);
    return true;
  }

  bool visitLoadInst(LoadInst &LI) {
    insertBefore(LI);
    Value *Addr = getPromotedPointer(LI.getPointerOperand());

    LoadInst *NewLI = Builder.CreateLoad(LI.getType(), Addr, LI.getName());
    NewLI->setVolatile(LI.isVolatile());
    NewLI->setAlignment(LI.getAlignment());
    NewLI->setOrdering(LI.getOrdering());
    NewLI->setSyncScopeID(LI.getSyncScopeID());

    Value *New = LI.getType()->isPointerTy() ? promotePointer(NewLI) : NewLI;
    replaceWith(&LI, New);
    return true;
  }

  bool visitStoreInst(StoreInst &SI) {
    insertBefore(SI);
    Value *Addr = getPromotedPointer(SI.getPointerOperand());
    Value *Val = SI.getValueOperand();
    if (Val->getType()->isPointerTy())
      Val = demotePointer(Val);

    StoreInst *NewSI = Builder.CreateStore(Val, Addr, SI.isVolatile());
    NewSI->setAlignment(SI.getAlignment());
    NewSI->setOrdering(SI.getOrdering());
    NewSI->setSyncScopeID(SI.getSyncScopeID());

    SI.eraseFromParent();
    return true;
  }

  bool visitAtomicCmpXchgInst(AtomicCmpXchgInst &AI) {
    insertBefore(AI);

    Value *Addr = getPromotedPointer(AI.getPointerOperand());
    Value *Cmp = AI.getCompareOperand();
    Value *New = AI.getNewValOperand();
    if (Cmp->getType()->isPointerTy()) {
      Cmp = demotePointer(Cmp);
      New = demotePointer(New);
    }

    AtomicCmpXchgInst *NewAI = Builder.CreateAtomicCmpXchg(
        Addr, Cmp, New, AI.getSuccessOrdering(), AI.getFailureOrdering(),
        AI.getSyncScopeID());
    NewAI->setVolatile(AI.isVolatile());
    NewAI->setWeak(AI.isWeak());
    NewAI->setName(AI.getName());

    replaceWith(&AI, NewAI);
    return true;
  }

  bool visitAtomicRMWInst(AtomicRMWInst &AI) {
    insertBefore(AI);

    Value *Addr = getPromotedPointer(AI.getPointerOperand());

    AtomicRMWInst *NewAI =
        Builder.CreateAtomicRMW(AI.getOperation(), Addr, AI.getValOperand(),
                                AI.getOrdering(), AI.getSyncScopeID());
    NewAI->setVolatile(AI.isVolatile());
    NewAI->setName(AI.getName());

    replaceWith(&AI, NewAI);
    return true;
  }

  bool visitGetElementPtrInst(GetElementPtrInst &GI) {
    insertBefore(GI);

    Value *Base = getPromotedPointer(GI.getPointerOperand());

    SmallVector<Value *, 4> Indices;
    for (Value *Idx : GI.indices())
      Indices.push_back(Idx);

    Value *New = Builder.CreateGEP(GI.getSourceElementType(), Base, Indices,
                                   GI.getName());
    if (GI.isInBounds()) {
      // FIXME: what if the irbuilder finds it *is* a constant.
      cast<GetElementPtrInst>(New)->setIsInBounds(GI.isInBounds());
    } else {
      // Original GEP guaranteed 2s-complement wrapping at 32-bits so we must do
      // the same.
      New = Builder.CreateAddrSpaceCast(New, getDemotedType(New->getType()));
      New = Builder.CreateAddrSpaceCast(New, getPromotedType(New->getType()));
    }

    replaceWith(&GI, New);
    return true;
  }

  bool visitPtrToIntInst(PtrToIntInst &PI) {
    insertBefore(PI);

    // FIXME: should this be addrspacecast then ptrtoint? Overflow behaviour.
    Value *NewPI = Builder.CreatePtrToInt(
        getPromotedPointer(PI.getPointerOperand()), PI.getType(), PI.getName());

    replaceWith(&PI, NewPI);
    return true;
  }

  bool visitIntToPtrInst(IntToPtrInst &II) {
    insertBefore(II);

    // FIXME: should this be addrspacecast then ptrtoint? Overflow behaviour.
    Value *NewII = Builder.CreateIntToPtr(
        II.getOperand(0), getPromotedType(II.getType()), II.getName());

    replaceWith(&II, NewII);
    return true;
  }

  bool visitBitCastInst(BitCastInst &BI) {
    if (!BI.getType()->isPointerTy())
      return false;

    insertBefore(BI);
    // FIXME: should this be addrspacecast then ptrtoint? Overflow behaviour.
    Value *NewBI =
        Builder.CreateBitCast(getPromotedPointer(BI.getOperand(0)),
                              getPromotedType(BI.getType()), BI.getName());

    replaceWith(&BI, NewBI);
    return true;
  }

  bool visitAddrSpaceCastInst(AddrSpaceCastInst &AI) {
    // FIXME: what to do with existing 64-bit pointers.
    return false;
  }

  bool visitICmpInst(ICmpInst &CI) {
    if (!CI.getOperand(0)->getType()->isPointerTy())
      return false;

    insertBefore(CI);
    // FIXME: explain why we must demote here.
    Value *LHS = demotePointer(CI.getOperand(0));
    Value *RHS = demotePointer(CI.getOperand(1));
    Value *New = Builder.CreateICmp(CI.getPredicate(), LHS, RHS, CI.getName());

    replaceWith(&CI, New);
    return true;
  }

  bool visitPHINode(PHINode &PI) {
    if (!PI.getType()->isPointerTy())
      return false;

    insertBefore(PI);

    // We can't add incoming values yet because we haven't necessarily promoted
    // them, so save the phi for later fixup.
    PHINode *NewPI = Builder.CreatePHI(getPromotedType(PI.getType()),
                                       PI.getNumIncomingValues(), PI.getName());
    PHIMap[&PI] = NewPI;

    replaceWith(&PI, NewPI);
    return true;
  }

  void fixupPHIs() {
    for (std::pair<PHINode *, PHINode *> Vals : PHIMap) {
      PHINode *PI = Vals.first;
      PHINode *NewPI = Vals.second;

      for (BasicBlock *BB : PI->blocks())
        NewPI->addIncoming(getPromotedPointer(PI->getIncomingValueForBlock(BB)),
                           BB);
    }
  }

  bool visitSelectInst(SelectInst &SI) {
    if (!SI.getType()->isPointerTy())
      return false;

    insertBefore(SI);
    Value *True = getPromotedPointer(SI.getTrueValue());
    Value *False = getPromotedPointer(SI.getFalseValue());
    Value *NewSI =
        Builder.CreateSelect(SI.getCondition(), True, False, SI.getName());

    replaceWith(&SI, NewSI);
    return true;
  }

  static Function *getPromotedIntrinsic(Function *F) {
    if (!F->isIntrinsic())
      return nullptr;

    FunctionType *FTy = F->getFunctionType();

    switch (F->getIntrinsicID()) {
    case Intrinsic::aarch64_neon_ld1x2: {
      Type *Tys[] = {
          cast<StructType>(FTy->getReturnType())->getTypeAtIndex(0u),
          PointerType::get(
              cast<PointerType>(FTy->getParamType(0))->getElementType(), 1)};
      return Intrinsic::getDeclaration(F->getParent(), F->getIntrinsicID(),
                                       ArrayRef<Type *>(Tys));
    }
      // FIXME: lots more intrinsics
    default:
      return nullptr;
    }
  }

  bool visitCallInst(CallInst &CI) {
    insertBefore(CI);

    Function *PromotedIntrinsic = nullptr;
    if (isa<IntrinsicInst>(CI))
      PromotedIntrinsic = getPromotedIntrinsic(CI.getCalledFunction());

    SmallVector<Value *, 10> Args;
    for (Value *Arg : CI.args()) {
      // FIXME: metadata containing value???????????????
      if (!Arg->getType()->isPointerTy()) {
        Args.push_back(Arg);
        continue;
      } else if (PromotedIntrinsic)
        Args.push_back(getPromotedPointer(Arg));
      else
        Args.push_back(demotePointer(Arg));
    }

    Value *Callee = PromotedIntrinsic ? PromotedIntrinsic : CI.getCalledValue();
    FunctionType *FTy = PromotedIntrinsic ? PromotedIntrinsic->getFunctionType()
                                          : CI.getFunctionType();
    if (!CI.getCalledFunction() && !CI.isInlineAsm())
      Callee = promotePointer(Callee);

    CallInst *NewCI = Builder.CreateCall(FTy, Callee, Args, CI.getName());
    NewCI->setTailCallKind(CI.getTailCallKind());
    NewCI->setAttributes(CI.getAttributes());
    NewCI->setCallingConv(CI.getCallingConv());
    if (CI.canReturnTwice())
      NewCI->setCanReturnTwice();

    // FIXME: data operands?

    Value *New = CI.getType()->isPointerTy() ? promotePointer(NewCI) : NewCI;
    replaceWith(&CI, New);
    return true;
  }

  bool visitDbgValueInst(DbgValueInst &DI) {
    Value *V = DI.getValue();
    if (!V->getType()->isPointerTy())
      return false;

    // FIXME: do we need to re-demote? Size of value changes, but I don't know
    // if that gets propagated to DWARF.
    DIBuilder.insertDbgValueIntrinsic(getPromotedPointer(V), DI.getVariable(),
                                      DI.getExpression(),
                                      DI.getDebugLoc().get(), &DI);
    DI.eraseFromParent();
    return true;
  }

  bool visitVAArgInst(VAArgInst &VI) {
    insertBefore(VI);

    Value *List = getPromotedPointer(VI.getPointerOperand());
    Value *New = Builder.CreateVAArg(List, VI.getType(), VI.getName());
    if (VI.getType()->isPointerTy())
      New = promotePointer(New);

    replaceWith(&VI, New);
    return true;
  }

  // FIXME: landingpad? catchpad? cleanuppad?
};


class AArch64PromotePointer : public FunctionPass {

public:
  static char ID;
  AArch64PromotePointer() : FunctionPass(ID) {
    initializeAArch64PromotePointerPass(*PassRegistry::getPassRegistry());
  }

  StringRef getPassName() const override {
    return "AArch64 Pointer Promotion";
  }

  bool runOnFunction(Function &F) override;
};
} // end anonymous namespace.

char AArch64PromotePointer::ID = 0;

INITIALIZE_PASS(AArch64PromotePointer, "aarch64-promote-pointer",
                "AArch64 Promote Pointer Pass", false, false)

FunctionPass *llvm::createAArch64PromotePointerPass() {
  return new AArch64PromotePointer();
}

bool AArch64PromotePointer::runOnFunction(Function &F) {
  PointerPromoter PP(F.getParent()->getContext(), *F.getParent());
  PP.visitFunctionArgs(F);

  ReversePostOrderTraversal<Function *> RPOT(&F);
  for (BasicBlock *BB : RPOT)
    PP.visit(BB);

  PP.fixupPHIs();

  for (auto *I : PP.InstsToRemove) {
    // All uses will eventually be removed too, but removing an instruction
    // asserts if it has any uses at that time.
    I->replaceAllUsesWith(UndefValue::get(I->getType()));
    I->eraseFromParent();
  }
  return true;
}
