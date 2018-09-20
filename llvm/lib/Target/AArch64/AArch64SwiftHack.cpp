//===--- AArch64SwiftHack.cpp ------- Remove uses of msgSend_stret --------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Swift calls some of its runtime functions that are implemented in C++ with
// mismatched prototypes. This pass searches for all such callsites and replaces
// them with a shim to marshall the values to where they're expected.
//
// ===---------------------------------------------------------------------===//

#include "AArch64.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Operator.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"

using namespace llvm;

#define DEBUG_TYPE "aarch64-swift-hack"

static cl::opt<bool> EnableSwiftHack(
    "aarch64-swift-hack", cl::Hidden,
    cl::desc("Convert Swift struct return to i64"), cl::init(true));

//===----------------------------------------------------------------------===//
//                       AArch64SwiftHack
//===----------------------------------------------------------------------===//

namespace llvm {
void initializeAArch64SwiftHackPass(PassRegistry &);
}

namespace {
class AArch64SwiftHack : public ModulePass {

public:
  static char ID;
  AArch64SwiftHack() : ModulePass(ID) {
    initializeAArch64SwiftHackPass(*PassRegistry::getPassRegistry());
  }

  StringRef getPassName() const override {
    return "AArch64 Swift Hack";
  }

  bool replaceBrokenSwiftCall(Module &M, Function &F);

  Value *castVal(IRBuilder<> &Builder, Value *V, Type *Dst) {
    if (Dst->isPointerTy())
      return Builder.CreateIntToPtr(V, Dst);
    return Builder.CreateBitCast(V, Dst);
  }

  bool runOnModule(Module &M) override;
};
} // end anonymous namespace.

char AArch64SwiftHack::ID = 0;

INITIALIZE_PASS(AArch64SwiftHack, "aarch64-swift-hack-pass",
                "AArch64 ARM Swift Hack Pass", false, false)

ModulePass *llvm::createAArch64SwiftHackPass() {
  return new AArch64SwiftHack();
}

bool AArch64SwiftHack::replaceBrokenSwiftCall(Module &M, Function &F) {
  LLVMContext &Ctx = M.getContext();

  // Definitions are correct by definition.
  if (!F.isDeclaration())
    return false;

  Type *Int32Ty = IntegerType::get(Ctx, 32);
  Type *Int64Ty = IntegerType::get(Ctx, 64);

  FunctionType *OldTy = F.getFunctionType();
  StructType *RetTy = dyn_cast<StructType>(OldTy->getReturnType());

  // Parts of Swift are implemented in C++ and get it right.
  if (!RetTy)
    return false;

  FunctionType *NewTy =
      FunctionType::get(Int64Ty, OldTy->params(), OldTy->isVarArg());
  FunctionCallee NewF =
      M.getOrInsertFunction(F.getName(), NewTy, F.getAttributes());

  Value::user_iterator It, NextIt;
  SmallVector<Value *, 8> FunctionUses(F.users());
  for (auto U : FunctionUses) {
    CallInst *CI = dyn_cast<CallInst>(U);
    if (!CI)
      continue;

    IRBuilder<> Builder(CI);
    SmallVector<Value *, 1> Ops(CI->arg_begin(), CI->arg_end());
    auto NewCI = Builder.CreateCall(NewF, Ops, "call");

    Value *Lo = Builder.CreateTrunc(NewCI, Int32Ty);
    Lo = castVal(Builder, Lo, RetTy->getTypeAtIndex(0u));

    Value *Hi = Builder.CreateLShr(NewCI, ConstantInt::get(Int64Ty, 32));
    Hi = Builder.CreateTrunc(Hi, Int32Ty);
    Hi = castVal(Builder, Hi, RetTy->getTypeAtIndex(1u));

    Value *Res = Builder.CreateInsertValue(UndefValue::get(RetTy), Lo, 0);
    Res = Builder.CreateInsertValue(Res, Hi, 1, CI->getName());
    CI->replaceAllUsesWith(Res);
    CI->eraseFromParent();
  }

  return true;
}

bool AArch64SwiftHack::runOnModule(Module &M) {
  bool Changed = false;
  if (!EnableSwiftHack)
    return false;

  auto replaceBrokenCall = [&](const char *FunctionName) {
    if (Function *F = M.getFunction(FunctionName))
    Changed |= replaceBrokenSwiftCall(M, *F);
  };

  // In theory, Super is unavailable on non-macos-fragile ABIs, but in practice,
  // it's declared and defined in objc4 for all non-arm64 platforms.
  replaceBrokenCall("swift_allocBox");
  replaceBrokenCall("swift_makeBoxUnique");
  replaceBrokenCall("swift_allocError");
  replaceBrokenCall("swift_getTypeName");
  replaceBrokenCall("swift_objc_class_unknownGetInstanceExtents");
  replaceBrokenCall("_getSwiftClassInstanceExtents");
  replaceBrokenCall("_getObjCClassInstanceExtents");
  replaceBrokenCall("swift_ObjCMirror_subscript");
  replaceBrokenCall("swift_class_getInstanceExtents");

  return Changed;
}
