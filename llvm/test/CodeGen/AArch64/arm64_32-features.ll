; RUN: opt -mtriple=arm64_32-apple-watchos -aarch64-arm-compat -aarch64-watch-bitcode-compatibility -S %s | FileCheck %s --check-prefix=CHECK-FEATURES
; RUN: llc -mtriple=arm64_32-apple-watchos -aarch64-watch-bitcode-compatibility  %s -o - 2>&1 | FileCheck %s --check-prefix=CHECK-DIAGS --allow-empty

; CHECK-DIAGS-NOT: not a recognized processor
; CHECK-DIAGS-NOT: not a recognized feature

define void @foo() #0 {
  ret void
}

; CHECK-FEATURES: attributes #0 = { "target-cpu"="cyclone" "target-features"="+crc,+crypto,+fp-armv8,+neon,+zcm,+zcz" }
attributes #0 = { "target-cpu"="cortex-a7" "target-features"="+dsp,+hwdiv,+hwdiv-arm,+neon,+thumb-mode,+vfp4" }
