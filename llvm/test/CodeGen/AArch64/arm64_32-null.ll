; RUN: llc -fast-isel=true  -global-isel=false -O0 -mtriple=arm64_32-apple-ios %s -o - | FileCheck %s --check-prefix=CHECK --check-prefix=FAST
; RUN: llc -fast-isel=false -global-isel=false -O0 -mtriple=arm64_32-apple-ios %s -o - | FileCheck %s --check-prefix=CHECK --check-prefix=OPT

define void @test_store(i8** %p) {
; CHECK-LABEL: test_store:
; CHECK: mov {{x|w}}[[R1:[0-9]+]], {{x|w}}zr
; CHECK: str w[[R1]], [x0]

  store i8* null, i8** %p
  ret void
}

define void @test_phi(i8** %p) {
; CHECK-LABEL: test_phi:
; CHECK: mov [[R1:x[0-9]+]], xzr
; CHECK: str [[R1]], [sp]
; CHECK: b [[BB:LBB[0-9_]+]]
; CHECK: [[BB]]:
; CHECK-OPT: ldr x0, [sp]
; CHECK-OPT: mov [[R2:w[0-9]+]], w0
; CHECK-FAST: ldr x[[R2:[0-9]+]], [sp]
; CHECK-FAST: str [[R2]], [x{{.*}}]

bb0:
  br label %bb1
bb1:
  %tmp0 = phi i8* [ null, %bb0 ]
  store i8* %tmp0, i8** %p
  ret void
}
