; RUN: llc -mtriple=arm64_32-apple-watchos %s -o - -aarch64-watch-bitcode-compatibility | FileCheck %s

define void @test_compat() {
; CHECK-LABEL: test_compat:
; CHECK: mov x29, x29 ; marker for objc_retainAutoreleaseReturnValue
  call void asm sideeffect "mov\09r7, r7\09\09@ marker for return value optimization", ""()
  ret void
}

!clang.arc.retainAutoreleasedReturnValueMarker = !{!0}

!0 = !{!"mov\09r7, r7\09\09@ marker for return value optimization"}
