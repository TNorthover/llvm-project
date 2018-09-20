//===--- AArch64StretCompatibility.cpp -- Remove uses of msgSend_stret ----===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// A pass to replace all uses of the objc_msgSend_stret family of functions with
// their non-stret equivalents. AArch64 passes sret pointers in x8 so there's no
// ABI difference that needs to be accounted for and the _stret variants simply
// don't exist.
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

#define DEBUG_TYPE "aarch64-stret-compat"

static cl::opt<bool> EnableStretCompatibility(
    "aarch64-stret-compatibility", cl::Hidden,
    cl::desc("Convert ARM stret IR to AArch64 form"), cl::init(true));

//===----------------------------------------------------------------------===//
//                       AArch64StretCompatibility
//===----------------------------------------------------------------------===//

namespace llvm {
void initializeAArch64StretCompatibilityPass(PassRegistry &);
}

namespace {
class AArch64StretCompatibility : public ModulePass {

public:
  static char ID;
  AArch64StretCompatibility() : ModulePass(ID) {
    initializeAArch64StretCompatibilityPass(*PassRegistry::getPassRegistry());
  }

  StringRef getPassName() const override {
    return "AArch64 Stret Compatibiltiy";
  }

  /// Replace an @objc_msgSend_stret call with its non-sret equivalent.
  /// AArch64 Objective-C doesn't support _stret, as the regular calling
  /// convention already reserves x8 for sret parameters.
  bool replaceObjCMsgSendStret(Module &M, Function &F);

  bool runOnModule(Module &M) override;
};
} // end anonymous namespace.

char AArch64StretCompatibility::ID = 0;

INITIALIZE_PASS(AArch64StretCompatibility, "aarch64-stret-compat",
                "AArch64 ARM Stret Compatibility Pass", false, false)

ModulePass *llvm::createAArch64StretCompatibilityPass() {
  return new AArch64StretCompatibility();
}

bool AArch64StretCompatibility::replaceObjCMsgSendStret(Module &M,
                                                        Function &F) {
  StringRef FnName = F.getName();

  StringRef MsgSendName = FnName.drop_back(strlen("_stret"));

  LLVMContext &Ctx = M.getContext();
  // Preserve attributes, and add nonlazybind, even though it's currently
  // ignored on AArch64; let's be resilient to change.
  AttributeList DeclAttrs = F.getAttributes();
  if (FnName == "objc_msgSend")
    DeclAttrs = DeclAttrs.addAttribute(Ctx, AttributeList::FunctionIndex,
                                       Attribute::NonLazyBind);

  // Declaration type doesn't really matter because these functions are always
  // bitcast before use, default to the same as the _stret variant (even though
  // that's different to what a native version would look like). In practice we
  // expect them to be mostly defined already, in which case we'll get a
  // helpfully casted version back from getOrInsertFunction.
  FunctionCallee MsgSend =
      M.getOrInsertFunction(MsgSendName, F.getFunctionType(), DeclAttrs);
  F.replaceAllUsesWith(MsgSend.getCallee());
  F.removeFromParent();
  return true;
}

bool AArch64StretCompatibility::runOnModule(Module &M) {
  bool Changed = false;
  if (!EnableStretCompatibility)
    return false;

  // In theory, Super is unavailable on non-macos-fragile ABIs, but in practice,
  // it's declared and defined in objc4 for all non-arm64 platforms.
  if (Function *F = M.getFunction("objc_msgSend_stret"))
    Changed |= replaceObjCMsgSendStret(M, *F);
  if (Function *F = M.getFunction("objc_msgSendSuper_stret"))
    Changed |= replaceObjCMsgSendStret(M, *F);
  if (Function *F = M.getFunction("objc_msgSendSuper2_stret"))
    Changed |= replaceObjCMsgSendStret(M, *F);
  if (Function *F = M.getFunction("objc_msgForward_stret"))
    Changed |= replaceObjCMsgSendStret(M, *F);

  return Changed;
}
