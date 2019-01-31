//==-- AArch64ARMCompatibility.cpp -- Upgrade ARM-specific IR to AArch64 ---==//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// A pass to replace all ARM-specific IR constructs (such as @llvm.arm.*
// intrinsics) with equivalent IR that is compatible with AArch64.
//
// ===---------------------------------------------------------------------===//

#include "AArch64.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Operator.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"

using namespace llvm;

#define DEBUG_TYPE "aarch64-arm-compat"

static cl::opt<bool> EnableARMCompatibility(
    "aarch64-arm-compatibility", cl::Hidden,
    cl::desc("Convert ARM IR to AArch64 form"), cl::init(true));

//===----------------------------------------------------------------------===//
//                       AArch64ARMCompatibility
//===----------------------------------------------------------------------===//

namespace llvm {
void initializeAArch64ARMCompatibilityPass(PassRegistry &);
}

namespace {
class AArch64ARMCompatibility : public FunctionPass {

public:
  static char ID;
  AArch64ARMCompatibility() : FunctionPass(ID) {
    initializeAArch64ARMCompatibilityPass(*PassRegistry::getPassRegistry());
  }

  StringRef getPassName() const override {
    return "AArch64 ARM Compatibiltiy";
  }

  /// The TBL and TBX instructions have different semantics on AArch64 and
  /// AArch32 (the table vectors are intrinsically 16-elements wide in AArch32,
  /// 8 in AArch32 which throws the indexes off). This expands them into the
  /// required sequence of IR instructions.
  void replaceTable(IntrinsicInst &CI, bool IsExtend);

  /// Load/store intrinsics in AArch32 have an extra alignment hint operand and
  /// the position of the pointer argument is different, so they need special
  /// handling.
  void replaceLoadStore(IntrinsicInst &CI, Type *VTy, Intrinsic::ID NewID);

  /// Many AArch32 shifts by a fixed amount are still written in a way following
  /// the IR shift instructions (i.e. the amount is a constant splat
  /// vector). This needs to be squashed down to a single ConstantInt for
  /// AArch64.
  Value *replaceScalarShift(IntrinsicInst &CI, Intrinsic::ID NewID);

  /// Generically, we just need to replace one intrinsic call with another. The
  /// main difference is how many types polymorphic ones need to specify the
  /// output.
  Value *replaceGeneric(IntrinsicInst &CI, Intrinsic::ID NewID, int NumTypes);

  /// Replace a call to an @llvm.arm.* intrinsic with an equivalent IR sequence,
  /// possibly using @llvm.aarch64.* intrinsics.
  bool replaceARMIntrinsicUse(IntrinsicInst &CI);

  bool runOnFunction(Function &F) override;
};
} // end anonymous namespace.

char AArch64ARMCompatibility::ID = 0;

INITIALIZE_PASS(AArch64ARMCompatibility, "aarch64-arm-compat",
                "AArch64 ARM Compatibility Pass", false, false)

FunctionPass *llvm::createAArch64ARMCompatibilityPass() {
  return new AArch64ARMCompatibility();
}


struct INTRINMapping {
  Intrinsic::ID ARMID, AArch64ID;
  int NumTypes;
};

#define INTMAP0(ARMID, AArch64ID) { Intrinsic::ARMID, Intrinsic::AArch64ID, 0 }
#define INTMAP1(ARMID, AArch64ID) { Intrinsic::ARMID, Intrinsic::AArch64ID, 1 }
#define INTMAP2(ARMID, AArch64ID) { Intrinsic::ARMID, Intrinsic::AArch64ID, 2 }
static INTRINMapping IdenticalIntrinsics[] = {
  INTMAP0(arm_clrex, aarch64_clrex),
  INTMAP0(arm_crc32b, aarch64_crc32b),
  INTMAP0(arm_crc32cb, aarch64_crc32cb),
  INTMAP0(arm_crc32h, aarch64_crc32h),
  INTMAP0(arm_crc32ch, aarch64_crc32ch),
  INTMAP0(arm_crc32w, aarch64_crc32w),
  INTMAP0(arm_crc32cw, aarch64_crc32cw),
  INTMAP0(arm_dmb, aarch64_dmb),
  INTMAP0(arm_dsb, aarch64_dsb),
  INTMAP0(arm_isb, aarch64_isb),
  INTMAP0(arm_hint, aarch64_hint),
  INTMAP1(arm_neon_vhadds, aarch64_neon_shadd),
  INTMAP1(arm_neon_vhaddu, aarch64_neon_uhadd),
  INTMAP1(arm_neon_vrhadds, aarch64_neon_srhadd),
  INTMAP1(arm_neon_vrhaddu, aarch64_neon_urhadd),
  INTMAP1(arm_neon_vqadds, aarch64_neon_sqadd),
  INTMAP1(arm_neon_vqaddu, aarch64_neon_uqadd),
  INTMAP1(arm_neon_vraddhn, aarch64_neon_raddhn),
  INTMAP1(arm_neon_vmulp, aarch64_neon_pmul),
  INTMAP1(arm_neon_vqdmulh, aarch64_neon_sqdmulh),
  INTMAP1(arm_neon_vqrdmulh, aarch64_neon_sqrdmulh),
  INTMAP1(arm_neon_vmulls, aarch64_neon_smull),
  INTMAP1(arm_neon_vmullu, aarch64_neon_umull),
  INTMAP1(arm_neon_vmullp, aarch64_neon_pmull),
  INTMAP1(arm_neon_vqdmull, aarch64_neon_sqdmull),
  INTMAP1(arm_neon_vmaxu, aarch64_neon_umax),
  INTMAP1(arm_neon_vmaxnm, aarch64_neon_fmaxnm),
  INTMAP1(arm_neon_vminu, aarch64_neon_umin),
  INTMAP1(arm_neon_vminnm, aarch64_neon_fminnm),
  INTMAP1(arm_neon_vrecps, aarch64_neon_frecps),
  INTMAP1(arm_neon_vrsqrts, aarch64_neon_frsqrts),
  INTMAP1(arm_neon_vhsubs, aarch64_neon_shsub),
  INTMAP1(arm_neon_vhsubu, aarch64_neon_uhsub),
  INTMAP1(arm_neon_vqsubs, aarch64_neon_sqsub),
  INTMAP1(arm_neon_vqsubu, aarch64_neon_uqsub),
  INTMAP1(arm_neon_vrsubhn, aarch64_neon_rsubhn),
  INTMAP2(arm_neon_vacge, aarch64_neon_facge),
  INTMAP2(arm_neon_vacgt, aarch64_neon_facgt),
  INTMAP1(arm_neon_vabdu, aarch64_neon_uabd),
  INTMAP1(arm_neon_vpadd, aarch64_neon_addp),
  INTMAP2(arm_neon_vpaddls, aarch64_neon_saddlp),
  INTMAP2(arm_neon_vpaddlu, aarch64_neon_uaddlp),
  INTMAP1(arm_neon_vpmaxu, aarch64_neon_umaxp),
  INTMAP1(arm_neon_vpminu, aarch64_neon_uminp),
  INTMAP1(arm_neon_vshifts, aarch64_neon_sshl),
  INTMAP1(arm_neon_vshiftu, aarch64_neon_ushl),
  INTMAP1(arm_neon_vrshifts, aarch64_neon_srshl),
  INTMAP1(arm_neon_vrshiftu, aarch64_neon_urshl),
  INTMAP1(arm_neon_vqshifts, aarch64_neon_sqshl),
  INTMAP1(arm_neon_vqshiftu, aarch64_neon_uqshl),
  INTMAP1(arm_neon_vqshiftsu, aarch64_neon_sqshlu),
  INTMAP1(arm_neon_vqrshifts, aarch64_neon_sqrshl),
  INTMAP1(arm_neon_vqrshiftu, aarch64_neon_uqrshl),
  INTMAP1(arm_neon_vabs, aarch64_neon_abs),
  INTMAP1(arm_neon_vqabs, aarch64_neon_sqabs),
  INTMAP1(arm_neon_vqneg, aarch64_neon_sqneg),
  INTMAP1(arm_neon_vcls, aarch64_neon_cls),
  INTMAP1(arm_neon_vcvtau, aarch64_neon_fcvtau),
  INTMAP1(arm_neon_vcvtas, aarch64_neon_fcvtas),
  INTMAP1(arm_neon_vcvtnu, aarch64_neon_fcvtnu),
  INTMAP1(arm_neon_vcvtns, aarch64_neon_fcvtns),
  INTMAP1(arm_neon_vcvtpu, aarch64_neon_fcvtpu),
  INTMAP1(arm_neon_vcvtps, aarch64_neon_fcvtps),
  INTMAP1(arm_neon_vcvtmu, aarch64_neon_fcvtmu),
  INTMAP1(arm_neon_vcvtms, aarch64_neon_fcvtms),
  INTMAP2(arm_neon_vcvtfp2fxs, aarch64_neon_vcvtfp2fxs),
  INTMAP2(arm_neon_vcvtfp2fxu, aarch64_neon_vcvtfp2fxu),
  INTMAP2(arm_neon_vcvtfxs2fp, aarch64_neon_vcvtfxs2fp),
  INTMAP2(arm_neon_vcvtfxu2fp, aarch64_neon_vcvtfxu2fp),
  INTMAP0(arm_neon_vcvtfp2hf, aarch64_neon_vcvtfp2hf),
  INTMAP0(arm_neon_vcvthf2fp, aarch64_neon_vcvthf2fp),
  INTMAP1(arm_neon_vqmovns, aarch64_neon_sqxtn),
  INTMAP1(arm_neon_vqmovnu, aarch64_neon_uqxtn),
  INTMAP1(arm_neon_vqmovnsu, aarch64_neon_sqxtun),
  INTMAP1(arm_neon_vrintn, aarch64_neon_frintn),
  INTMAP1(arm_neon_vrintx, rint),
  INTMAP1(arm_neon_vrinta, round),
  INTMAP1(arm_neon_vrintz, trunc),
  INTMAP1(arm_neon_vrintm, floor),
  INTMAP1(arm_neon_vrintp, ceil),
  INTMAP0(arm_neon_aesd, aarch64_crypto_aesd),
  INTMAP0(arm_neon_aese, aarch64_crypto_aese),
  INTMAP0(arm_neon_aesimc, aarch64_crypto_aesimc),
  INTMAP0(arm_neon_aesmc, aarch64_crypto_aesmc),
  INTMAP0(arm_neon_sha1h, aarch64_crypto_sha1h),
  INTMAP0(arm_neon_sha1su1, aarch64_crypto_sha1su1),
  INTMAP0(arm_neon_sha256su0, aarch64_crypto_sha256su0),
  INTMAP0(arm_neon_sha1c, aarch64_crypto_sha1c),
  INTMAP0(arm_neon_sha1m, aarch64_crypto_sha1m),
  INTMAP0(arm_neon_sha1p, aarch64_crypto_sha1p),
  INTMAP0(arm_neon_sha1su0, aarch64_crypto_sha1su0),
  INTMAP0(arm_neon_sha256h, aarch64_crypto_sha256h),
  INTMAP0(arm_neon_sha256h2, aarch64_crypto_sha256h2),
  INTMAP0(arm_neon_sha256su1, aarch64_crypto_sha256su1),
};
#undef INTMAP0
#undef INTMAP1
#undef INTMAP2

Value *AArch64ARMCompatibility::replaceGeneric(
    IntrinsicInst &CI, Intrinsic::ID NewID, int NumTypes) {
  Module *M = CI.getParent()->getParent()->getParent();

  // Add any necessary types to pin down a polymorphic intrinsic. Fortunately
  // for us, if 2 types are needed, they are always the return and first operand
  // type.
  assert(NumTypes >= 0 && NumTypes <= 2);
  SmallVector<Type *, 2> Types;
  if (NumTypes > 0)
    Types.push_back(CI.getType());
  if (NumTypes > 1)
    Types.push_back(CI.getOperand(0)->getType());

  Value *Callee = Intrinsic::getDeclaration(M, NewID, Types);

  SmallVector<Value *, 4> Args;
  for (auto &Arg : CI.arg_operands())
    Args.push_back(Arg);

  IRBuilder<> Builder(&CI);
  Value *NewCall = Builder.CreateCall(Callee, Args);
  CI.replaceAllUsesWith(NewCall);
  return NewCall;
}

Value *AArch64ARMCompatibility::replaceScalarShift(
    IntrinsicInst &CI, Intrinsic::ID NewID) {
  Module *M = CI.getParent()->getParent()->getParent();
  Value *Callee = Intrinsic::getDeclaration(M, NewID, CI.getType());

  Constant *ShiftC =
      cast<ConstantDataVector>(CI.getOperand(1))->getSplatValue();
  assert(ShiftC && "unexpected INTRIN shift without constant amount");
  int64_t ShiftAmt = cast<ConstantInt>(ShiftC)->getSExtValue();
  auto Shift = ConstantInt::get(Type::getInt32Ty(M->getContext()), -ShiftAmt);

  IRBuilder<> Builder(&CI);
  Value *NewCall = Builder.CreateCall(Callee, {CI.getOperand(0), Shift});
  CI.replaceAllUsesWith(NewCall);
  return NewCall;
}

/// AArch32 tables are a list of 64-bit registers, while AArch64 ones are a list
/// of 128-bit registers. So we need to pack the D-reg sequence into low & high
/// parts of the full vector registers before using AArch64's TBL or TBX
/// instructions.
///
/// If the incoming number of registers is odd, they won't quite fit, but we can
/// fudge the TBL's semantics by setting the high bits of the final register to
/// 0 (the corresponding parts of rD would be set to zero anyway). TBX needs
/// post-processing, so just use UNDEF.
static void packTblDVectorList(SmallVectorImpl<Value *> &Res,
                               User::op_iterator TblBegin,
                               User::op_iterator TblEnd, bool IsExtend,
                               Module *M, IRBuilder<> &Builder) {
  // Build a vector containing sequential number like (0, 1, 2, ..., 15)
  SmallVector<Constant*, 16> Indices;
  Type *Int32Ty = Type::getInt32Ty(M->getContext());
  for (unsigned i = 0, e = 16; i != e; ++i)
    Indices.push_back(ConstantInt::get(Int32Ty, i));

  Value *SV = llvm::ConstantVector::get(Indices);

  while (TblBegin != TblEnd) {
    Value *LowVec, *HighVec;

    LowVec = *TblBegin++;
    if (TblBegin != TblEnd)
      HighVec = *TblBegin++;
    else if (IsExtend)
      HighVec = UndefValue::get(LowVec->getType());
    else
      HighVec = ConstantAggregateZero::get(LowVec->getType());

    Value *Vec128 = Builder.CreateShuffleVector(LowVec, HighVec, SV);
    Res.push_back(Vec128);
  }
}


void AArch64ARMCompatibility::replaceTable(IntrinsicInst &CI,
                                              bool IsExtend) {
  Module *M = CI.getParent()->getParent()->getParent();
  IRBuilder<> Builder(&CI);

  SmallVector<Value *, 2> NewOps;
  User::op_iterator TblBegin = CI.op_begin();
  User::op_iterator TblEnd = std::prev(std::prev(CI.op_end()));
  if (IsExtend)
    NewOps.push_back(*TblBegin++);

  packTblDVectorList(NewOps, TblBegin, TblEnd, IsExtend, M, Builder);
  NewOps.push_back(*TblEnd);

  Intrinsic::ID NewID;
  switch (CI.getIntrinsicID()) {
  default: llvm_unreachable("Unknown TBL intrinsic");
  case Intrinsic::arm_neon_vtbl1:
    NewID = Intrinsic::aarch64_neon_tbl1;
    break;
  case Intrinsic::arm_neon_vtbl2:
    NewID = Intrinsic::aarch64_neon_tbl1;
    break;
  case Intrinsic::arm_neon_vtbl3:
    NewID = Intrinsic::aarch64_neon_tbl2;
    break;
  case Intrinsic::arm_neon_vtbl4:
    NewID = Intrinsic::aarch64_neon_tbl2;
    break;
  case Intrinsic::arm_neon_vtbx1:
    NewID = Intrinsic::aarch64_neon_tbx1;
    break;
  case Intrinsic::arm_neon_vtbx2:
    NewID = Intrinsic::aarch64_neon_tbx1;
    break;
  case Intrinsic::arm_neon_vtbx3:
    NewID = Intrinsic::aarch64_neon_tbx2;
    break;
  case Intrinsic::arm_neon_vtbx4:
    NewID = Intrinsic::aarch64_neon_tbx2;
    break;
  }

  Value *NewInt = Intrinsic::getDeclaration(M, NewID, CI.getType());
  Value *TblRes = Builder.CreateCall(NewInt, NewOps);

  if (CI.getIntrinsicID() != Intrinsic::arm_neon_vtbx1 &&
      CI.getIntrinsicID() != Intrinsic::arm_neon_vtbx3) {
    CI.replaceAllUsesWith(TblRes);
    return;
  }

  VectorType *VTy = cast<VectorType>(CI.getType());
  int TblSize = CI.getIntrinsicID() == Intrinsic::arm_neon_vtbx1 ? 8 : 24;
  llvm::Constant *MaxVal = ConstantInt::get(VTy->getElementType(), TblSize);
  Value *MaxVec = llvm::ConstantVector::getSplat(8, MaxVal);

  Value *CmpRes = Builder.CreateICmp(ICmpInst::ICMP_UGE, *TblEnd, MaxVec);
  CmpRes = Builder.CreateSExt(CmpRes, VTy);

  Value *EltsFromInput = Builder.CreateAnd(CmpRes, CI.getOperand(0));
  Value *EltsFromTbl = Builder.CreateAnd(Builder.CreateNot(CmpRes), TblRes);
  Value *Res = Builder.CreateOr(EltsFromInput, EltsFromTbl, "vtbx");

  CI.replaceAllUsesWith(Res);
}

void AArch64ARMCompatibility::replaceLoadStore(IntrinsicInst &CI,
                                                     Type *Ty,
                                                     Intrinsic::ID NewID) {
  Module *M = CI.getParent()->getParent()->getParent();
  VectorType *VTy = cast<VectorType>(Ty);
  PointerType *PtrVTy = PointerType::getUnqual(VTy->getElementType());
  Type *Types[] = { VTy, PtrVTy };
  Value *NewInt = Intrinsic::getDeclaration(M, NewID, Types);

  // Copy the vector and lane arguments across, but skip the final alignment
  // hint.
  SmallVector<Value *, 4> Args;
  for (unsigned i = 1; i < CI.getNumOperands() - 2; ++i) {
    Value *Arg = CI.getOperand(i);
    if (Arg->getType()->isIntegerTy()) {
      uint64_t Val = cast<ConstantInt>(Arg)->getZExtValue();
      Args.push_back(ConstantInt::get(Type::getInt64Ty(M->getContext()), Val));
    } else
      Args.push_back(Arg);
  }

  IRBuilder<> Builder(&CI);
  Args.push_back(Builder.CreateBitCast(CI.getOperand(0), PtrVTy));

  Value *Res = Builder.CreateCall(NewInt, Args);
  CI.replaceAllUsesWith(Res);
}

static bool isFloatingOperation(FunctionType *FTy) {
  if (FTy->getNumParams() == 0)
    return false;

  return FTy->getParamType(0)->getScalarType()->isFloatingPointTy();
}

bool AArch64ARMCompatibility::replaceARMIntrinsicUse(IntrinsicInst &CI) {
  Intrinsic::ID OldID = CI.getIntrinsicID();

  // FIXME: inefficient, consider sorting table and using std::lower_bound.
  auto Pos = std::find_if(
      std::begin(IdenticalIntrinsics), std::end(IdenticalIntrinsics),
      [=](const INTRINMapping &L) { return L.ARMID == OldID; });

  if (Pos != std::end(IdenticalIntrinsics)) {
    replaceGeneric(CI, Pos->AArch64ID, Pos->NumTypes);
    return true;
  }

  Module *M = CI.getParent()->getParent()->getParent();
  Type *Int32Ty = Type::getInt32Ty(M->getContext());
  bool IsFloat = isFloatingOperation(CI.getCalledFunction()->getFunctionType());
  IRBuilder<> Builder(&CI);

  switch (CI.getIntrinsicID()) {
  default:
    return false;
    // Vector Absolute Differences.
  case Intrinsic::arm_neon_vabds:
    replaceGeneric(CI, IsFloat ? Intrinsic::aarch64_neon_fabd
                               : Intrinsic::aarch64_neon_sabd,
                   1);
    return true;
  case Intrinsic::arm_neon_vmaxs:
    replaceGeneric(CI, IsFloat ? Intrinsic::aarch64_neon_fmax
                               : Intrinsic::aarch64_neon_smax,
                   1);
    return true;
  case Intrinsic::arm_neon_vmins:
    replaceGeneric(CI, IsFloat ? Intrinsic::aarch64_neon_fmin
                               : Intrinsic::aarch64_neon_smin,
                   1);
    return true;
  case Intrinsic::arm_neon_vpmaxs:
    replaceGeneric(CI, IsFloat ? Intrinsic::aarch64_neon_fmaxp
                               : Intrinsic::aarch64_neon_smaxp,
                   1);
    return true;
  case Intrinsic::arm_neon_vpmins:
    replaceGeneric(CI, IsFloat ? Intrinsic::aarch64_neon_fminp
                               : Intrinsic::aarch64_neon_sminp,
                   1);
    return true;
  case Intrinsic::arm_neon_vrecpe:
    replaceGeneric(CI, IsFloat ? Intrinsic::aarch64_neon_frecpe
                               : Intrinsic::aarch64_neon_urecpe,
                   1);
    return true;
  case Intrinsic::arm_neon_vrsqrte:
    replaceGeneric(CI, IsFloat ? Intrinsic::aarch64_neon_frsqrte
                               : Intrinsic::aarch64_neon_ursqrte,
                   1);
    return true;
  case Intrinsic::arm_neon_vpadals:
  case Intrinsic::arm_neon_vpadalu: {
    Type *Types[] = { CI.getType(), CI.getOperand(1)->getType() };
    auto NewID = CI.getIntrinsicID() == Intrinsic::arm_neon_vpadals
                     ? Intrinsic::aarch64_neon_saddlp
                     : Intrinsic::aarch64_neon_uaddlp;
    Value *NewInt = Intrinsic::getDeclaration(M, NewID, Types);
    Value *AddL = Builder.CreateCall(NewInt, CI.getOperand(1));
    Value *Res = Builder.CreateAdd(AddL, CI.getOperand(0));
    CI.replaceAllUsesWith(Res);
    return true;
  }
  case Intrinsic::arm_neon_vrshiftn:
    replaceScalarShift(CI, Intrinsic::aarch64_neon_rshrn);
    return true;
  case Intrinsic::arm_neon_vqshiftns:
    replaceScalarShift(CI, Intrinsic::aarch64_neon_sqshrn);
    return true;
  case Intrinsic::arm_neon_vqshiftnu:
    replaceScalarShift(CI, Intrinsic::aarch64_neon_uqshrn);
    return true;
  case Intrinsic::arm_neon_vqshiftnsu:
    replaceScalarShift(CI, Intrinsic::aarch64_neon_sqshrun);
    return true;
  case Intrinsic::arm_neon_vqrshiftns:
    replaceScalarShift(CI, Intrinsic::aarch64_neon_sqrshrn);
    return true;
  case Intrinsic::arm_neon_vqrshiftnu:
    replaceScalarShift(CI, Intrinsic::aarch64_neon_uqrshrn);
    return true;
  case Intrinsic::arm_neon_vqrshiftnsu:
    replaceScalarShift(CI, Intrinsic::aarch64_neon_sqrshrun);
    return true;
  case Intrinsic::arm_neon_vshiftins: {
    Module *M = CI.getParent()->getParent()->getParent();

    Constant *ShiftC =
        cast<ConstantDataVector>(CI.getOperand(2))->getSplatValue();
    assert(ShiftC && "unexpected INTRIN shift without constant amount");

    int64_t ShiftAmt = cast<ConstantInt>(ShiftC)->getSExtValue();
    Intrinsic::ID NewID = Intrinsic::aarch64_neon_vsli;
    if (ShiftAmt < 0) {
      ShiftAmt = -ShiftAmt;
      NewID = Intrinsic::aarch64_neon_vsri;
    }
    auto Shift = ConstantInt::get(Int32Ty, ShiftAmt);

    Value *Callee = Intrinsic::getDeclaration(M, NewID, CI.getType());
    Value *NewCall =
        Builder.CreateCall(Callee, {CI.getOperand(0), CI.getOperand(1), Shift});
    CI.replaceAllUsesWith(NewCall);
    return true;
  }
  case Intrinsic::arm_neon_vtbl1:
  case Intrinsic::arm_neon_vtbl2:
  case Intrinsic::arm_neon_vtbl3:
  case Intrinsic::arm_neon_vtbl4:
    replaceTable(CI, false);
    return true;
  case Intrinsic::arm_neon_vtbx1:
  case Intrinsic::arm_neon_vtbx2:
  case Intrinsic::arm_neon_vtbx3:
  case Intrinsic::arm_neon_vtbx4:
    replaceTable(CI, true);
    return true;
    // De-interleaving vector loads from N-element structures.
    // Source operands are the address and alignment.
  case Intrinsic::arm_neon_vld1: {
    Value *VecPtr = Builder.CreateBitCast(CI.getOperand(0),
                                          PointerType::getUnqual(CI.getType()));
    Value *Res = Builder.CreateLoad(VecPtr);
    CI.replaceAllUsesWith(Res);
    return true;
  }
  case Intrinsic::arm_neon_vst1: {
    Value *VecPtr = Builder.CreateBitCast(
        CI.getOperand(0), PointerType::getUnqual(CI.getOperand(1)->getType()));
    Value *Res = Builder.CreateStore(CI.getOperand(1), VecPtr);
    CI.replaceAllUsesWith(Res);
    return true;
  }
  case Intrinsic::arm_neon_vld2:
    replaceLoadStore(CI, cast<StructType>(CI.getType())->getTypeAtIndex(0U),
                     Intrinsic::aarch64_neon_ld2);
    return true;
  case Intrinsic::arm_neon_vld3:
    replaceLoadStore(CI, cast<StructType>(CI.getType())->getTypeAtIndex(0U),
                     Intrinsic::aarch64_neon_ld3);
    return true;
  case Intrinsic::arm_neon_vld4:
    replaceLoadStore(CI, cast<StructType>(CI.getType())->getTypeAtIndex(0U),
                     Intrinsic::aarch64_neon_ld4);
    return true;
    // Vector load N-element structure to one lane.
  case Intrinsic::arm_neon_vld2lane:
    replaceLoadStore(CI, cast<StructType>(CI.getType())->getTypeAtIndex(0U),
                     Intrinsic::aarch64_neon_ld2lane);
    return true;
  case Intrinsic::arm_neon_vld3lane:
    replaceLoadStore(CI, cast<StructType>(CI.getType())->getTypeAtIndex(0U),
                     Intrinsic::aarch64_neon_ld3lane);
    return true;
  case Intrinsic::arm_neon_vld4lane:
    replaceLoadStore(CI, cast<StructType>(CI.getType())->getTypeAtIndex(0U),
                     Intrinsic::aarch64_neon_ld4lane);
    return true;
  case Intrinsic::arm_neon_vst2:
    replaceLoadStore(CI, CI.getOperand(1)->getType(),
                     Intrinsic::aarch64_neon_st2);
    return true;
  case Intrinsic::arm_neon_vst3:
    replaceLoadStore(CI, CI.getOperand(1)->getType(),
                     Intrinsic::aarch64_neon_st3);
    return true;
  case Intrinsic::arm_neon_vst4:
    replaceLoadStore(CI, CI.getOperand(1)->getType(),
                     Intrinsic::aarch64_neon_st4);
    return true;
  case Intrinsic::arm_neon_vst2lane:
    replaceLoadStore(CI, CI.getOperand(1)->getType(),
                     Intrinsic::aarch64_neon_st2lane);
    return true;
  case Intrinsic::arm_neon_vst3lane:
    replaceLoadStore(CI, CI.getOperand(1)->getType(),
                     Intrinsic::aarch64_neon_st3lane);
    return true;
  case Intrinsic::arm_neon_vst4lane:
    replaceLoadStore(CI, CI.getOperand(1)->getType(),
                     Intrinsic::aarch64_neon_st4lane);
    return true;
    // Vector bitwise select.
  case Intrinsic::arm_neon_vbsl: {
    Value *FromL = Builder.CreateAnd(CI.getOperand(0), CI.getOperand(1));
    Value *FromR = Builder.CreateAnd(Builder.CreateNot(CI.getOperand(0)),
                                     CI.getOperand(2));
    Value *Res = Builder.CreateOr(FromL, FromR);
    CI.replaceAllUsesWith(Res);
    return true;
  }
  case Intrinsic::arm_ldrex: {
    Value *Callee = Intrinsic::getDeclaration(M, Intrinsic::aarch64_ldxr,
                                              CI.getArgOperand(0)->getType());
    Value *Loaded = Builder.CreateCall(Callee, CI.getArgOperand(0));
    Loaded = Builder.CreateTrunc(Loaded, Int32Ty);
    CI.replaceAllUsesWith(Loaded);
    return true;
  }
  case Intrinsic::arm_ldaex: {
    Value *Callee = Intrinsic::getDeclaration(M, Intrinsic::aarch64_ldaxr,
                                              CI.getArgOperand(0)->getType());
    Value *Loaded = Builder.CreateCall(Callee, CI.getArgOperand(0));
    Loaded = Builder.CreateTrunc(Loaded, Int32Ty);
    CI.replaceAllUsesWith(Loaded);
    return true;
  }
  case Intrinsic::arm_strex: {
    Value *Callee = Intrinsic::getDeclaration(M, Intrinsic::aarch64_stxr,
                                              CI.getArgOperand(1)->getType());
    Value *Val = Builder.CreateZExt(CI.getArgOperand(0),
                                    Type::getInt64Ty(M->getContext()));
    Value *Addr = CI.getArgOperand(1);
    Value *Success = Builder.CreateCall(Callee, {Val, Addr});
    CI.replaceAllUsesWith(Success);
    return true;
  }
  case Intrinsic::arm_stlex: {
    Value *Callee = Intrinsic::getDeclaration(M, Intrinsic::aarch64_stlxr,
                                              CI.getArgOperand(1)->getType());
    Value *Val = Builder.CreateZExt(CI.getArgOperand(0),
                                    Type::getInt64Ty(M->getContext()));
    Value *Addr = CI.getArgOperand(1);
    Value *Success = Builder.CreateCall(Callee, {Val, Addr});
    CI.replaceAllUsesWith(Success);
    return true;
  }
  case Intrinsic::arm_ldrexd: {
    Type *PTy = PointerType::getUnqual(Type::getInt64Ty(M->getContext()));
    Value *Callee = Intrinsic::getDeclaration(M, Intrinsic::aarch64_ldxr, PTy);

    Value *Addr= Builder.CreateBitCast(CI.getArgOperand(0), PTy);
    Value *Loaded = Builder.CreateCall(Callee, Addr);
    Value *Lo = Builder.CreateTrunc(Loaded, Int32Ty);
    Value *Hi = Builder.CreateTrunc(Builder.CreateLShr(Loaded, 32), Int32Ty);

    Value *Res = UndefValue::get(CI.getType());
    Res = Builder.CreateInsertValue(Res, Lo, 0);
    Res = Builder.CreateInsertValue(Res, Hi, 1);

    CI.replaceAllUsesWith(Res);
    return true;
  }
  case Intrinsic::arm_ldaexd: {
    Type *PTy = PointerType::getUnqual(Type::getInt64Ty(M->getContext()));
    Value *Callee = Intrinsic::getDeclaration(M, Intrinsic::aarch64_ldaxr, PTy);

    Value *Addr= Builder.CreateBitCast(CI.getArgOperand(0), PTy);
    Value *Loaded = Builder.CreateCall(Callee, Addr);
    Value *Lo = Builder.CreateTrunc(Loaded, Int32Ty);
    Value *Hi = Builder.CreateTrunc(Builder.CreateLShr(Loaded, 32), Int32Ty);

    Value *Res = UndefValue::get(CI.getType());
    Res = Builder.CreateInsertValue(Res, Lo, 0);
    Res = Builder.CreateInsertValue(Res, Hi, 1);

    CI.replaceAllUsesWith(Res);
    return true;
  }
  case Intrinsic::arm_strexd: {
    Type *Int64Ty = Type::getInt64Ty(M->getContext());
    Type *PTy = PointerType::getUnqual(Int64Ty);
    Value *Callee = Intrinsic::getDeclaration(M, Intrinsic::aarch64_stxr, PTy);

    Value *ValLo = Builder.CreateZExt(CI.getArgOperand(0), Int64Ty);
    Value *ValHi = Builder.CreateZExt(CI.getArgOperand(1), Int64Ty);
    Value *Val = Builder.CreateOr(ValLo, Builder.CreateShl(ValHi, 32));
    Value *Addr = Builder.CreateBitCast(CI.getArgOperand(2), PTy);
    Value *Success = Builder.CreateCall(Callee, {Val, Addr});

    CI.replaceAllUsesWith(Success);
    return true;
  }
  case Intrinsic::arm_stlexd: {
    Type *Int64Ty = Type::getInt64Ty(M->getContext());
    Type *PTy = PointerType::getUnqual(Int64Ty);
    Value *Callee = Intrinsic::getDeclaration(M, Intrinsic::aarch64_stlxr, PTy);

    Value *ValLo = Builder.CreateZExt(CI.getArgOperand(0), Int64Ty);
    Value *ValHi = Builder.CreateZExt(CI.getArgOperand(1), Int64Ty);
    Value *Val = Builder.CreateOr(ValLo, Builder.CreateShl(ValHi, 32));
    Value *Addr = Builder.CreateBitCast(CI.getArgOperand(2), PTy);
    Value *Success = Builder.CreateCall(Callee, {Val, Addr});

    CI.replaceAllUsesWith(Success);
    return true;
  }
  case Intrinsic::thread_pointer:
  case Intrinsic::arm_dbg: // No DBG or UDF instruction on AArch64.
  case Intrinsic::arm_undefined:
  case Intrinsic::arm_vcvtr: // No FPSCR or implicit rounding mode.
  case Intrinsic::arm_vcvtru:
  case Intrinsic::arm_get_fpscr:
  case Intrinsic::arm_set_fpscr:
  case Intrinsic::arm_mcr: // No coprocessor instructions, numbers don't match.
  case Intrinsic::arm_mcr2:
  case Intrinsic::arm_mrc:
  case Intrinsic::arm_mrc2:
  case Intrinsic::arm_cdp:
  case Intrinsic::arm_cdp2:
  case Intrinsic::arm_mcrr:
  case Intrinsic::arm_mcrr2:
  case Intrinsic::arm_qadd: // No saturation flag.
  case Intrinsic::arm_qsub:
  case Intrinsic::arm_ssat:
  case Intrinsic::arm_usat:
    report_fatal_error("intrinsic has no 64-bit counterpart");
  }

  return true;
}

static StringRef getObjCMarker(const Module &M) {
  NamedMDNode *NMD =
    M.getNamedMetadata("clang.arc.retainAutoreleasedReturnValueMarker");
  if (!NMD || NMD->getNumOperands() != 1)
    return StringRef();

  const MDNode *N = NMD->getOperand(0);
  if (N->getNumOperands() != 1)
    return StringRef();

  const MDString *S = dyn_cast<MDString>(N->getOperand(0));
  if (!S)
    return StringRef();

  return S->getString();
}

bool AArch64ARMCompatibility::runOnFunction(Function &F) {
  bool MadeChange = false;
  if (!EnableARMCompatibility || F.isDeclaration())
    return false;

  F.removeFnAttr("target-features");
  F.addFnAttr("target-features",
              "+crc,+crypto,+fp-armv8,+neon,+zcm,+zcz");
  F.removeFnAttr("target-cpu");
  F.addFnAttr("target-cpu", "cyclone");

  StringRef ObjCMarker = getObjCMarker(*F.getParent());

  SmallVector<IntrinsicInst *, 4> ReplacedVals;
  for (auto &BB : F) {
    for (auto &I : BB) {
      if (auto II = dyn_cast<IntrinsicInst>(&I)) {
        if (replaceARMIntrinsicUse(*II))
          ReplacedVals.push_back(II);
      } else if (auto CI = dyn_cast<CallInst>(&I)) {
        InlineAsm *IA = dyn_cast<InlineAsm>(CI->getCalledValue());
        if (!IA)
          continue;
        std::string Asm = IA->getAsmString();
        if ((!ObjCMarker.empty() && Asm == ObjCMarker) ||
            Asm.find("mov\tr7, r7\t\t@ marker for ") == 0) {
          CI->setCalledFunction(InlineAsm::get(
              IA->getFunctionType(),
              "mov\tfp, fp\t\t// marker for objc_retainAutoreleaseReturnValue",
              IA->getConstraintString(), IA->hasSideEffects()));
          MadeChange = true;
        }
      }
    }
  }

  if (ReplacedVals.empty())
    return MadeChange;

  for (auto Inst : ReplacedVals)
    Inst->eraseFromParent();

  return true;
}
