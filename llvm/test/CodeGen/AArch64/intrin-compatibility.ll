; RUN: llc -mtriple=arm64_32-apple-ios7.0 -aarch64-watch-bitcode-compatibility %s -o - | FileCheck %s

declare void @llvm.arm.clrex()
define void @test_clrex() {
; CHECK-LABEL: test_clrex:
; CHECK: clrex
  call void @llvm.arm.clrex()
  ret void
}

declare i32 @llvm.arm.crc32b(i32, i32) "target-features"
define i32 @test_crc32b(i32 %accum, i8 %new) {
; CHECK-LABEL: test_crc32b:
; CHECK: crc32b w0, w0, w1
  %new32 = zext i8 %new to i32
  %res = call i32 @llvm.arm.crc32b(i32 %accum, i32 %new32)
  ret i32 %res
}

declare i32 @llvm.arm.crc32cb(i32, i32)
define i32 @test_crc32cb(i32 %accum, i8 %new) {
; CHECK-LABEL: test_crc32cb:
; CHECK: crc32cb w0, w0, w1
  %new32 = zext i8 %new to i32
  %res = call i32 @llvm.arm.crc32cb(i32 %accum, i32 %new32)
  ret i32 %res
}

declare i32 @llvm.arm.crc32h(i32, i32)
define i32 @test_crc32h(i32 %accum, i16 %new) {
; CHECK-LABEL: test_crc32h:
; CHECK: crc32h w0, w0, w1
  %new32 = zext i16 %new to i32
  %res = call i32 @llvm.arm.crc32h(i32 %accum, i32 %new32)
  ret i32 %res
}

declare i32 @llvm.arm.crc32ch(i32, i32)
define i32 @test_crc32ch(i32 %accum, i16 %new) {
; CHECK-LABEL: test_crc32ch:
; CHECK: crc32ch w0, w0, w1
  %new32 = zext i16 %new to i32
  %res = call i32 @llvm.arm.crc32ch(i32 %accum, i32 %new32)
  ret i32 %res
}

declare i32 @llvm.arm.crc32w(i32, i32)
define i32 @test_crc32w(i32 %accum, i32 %new) {
; CWECK-LABEL: test_crc32w:
; CWECK: crc32w w0, w0, w1
  %res = call i32 @llvm.arm.crc32w(i32 %accum, i32 %new)
  ret i32 %res
}

declare i32 @llvm.arm.crc32cw(i32, i32)
define i32 @test_crc32cw(i32 %accum, i32 %new) {
; CWECK-LABEL: test_crc32cw:
; CWECK: crc32cw w0, w0, w1
  %res = call i32 @llvm.arm.crc32cw(i32 %accum, i32 %new)
  ret i32 %res
}

declare void @llvm.arm.dmb(i32)
define void @test_dmb() {
; CHECK-LABEL: test_dmb:
; CHECK: dmb sy
  call void @llvm.arm.dmb(i32 15)
  ret void
}

declare void @llvm.arm.dsb(i32)
define void @test_dsb() {
; CHECK-LABEL: test_dsb:
; CHECK: dsb sy
  call void @llvm.arm.dsb(i32 15)
  ret void
}

declare void @llvm.arm.isb(i32)
define void @test_isb() {
; CHECK-LABEL: test_isb:
; CHECK: isb
  call void @llvm.arm.isb(i32 15)
  ret void
}

declare void @llvm.arm.hint(i32)
define void @test_hint_nop() {
; CHECK-LABEL: test_hint_nop:
; CHECK: nop
  call void @llvm.arm.hint(i32 0)
  ret void
}

define void @test_hint_yield() {
; CHECK-LABEL: test_hint_yield:
; CHECK: yield
  call void @llvm.arm.hint(i32 1)
  ret void
}

define void @test_hint_wfe() {
; CHECK-LABEL: test_hint_wfe:
; CHECK: wfe
  call void @llvm.arm.hint(i32 2)
  ret void
}

define void @test_hint_wfi() {
; CHECK-LABEL: test_hint_wfi:
; CHECK: wfi
  call void @llvm.arm.hint(i32 3)
  ret void
}

define void @test_hint_sev() {
; CHECK-LABEL: test_hint_sev:
; CHECK: sev{{$}}
  call void @llvm.arm.hint(i32 4)
  ret void
}

declare i32 @llvm.arm.ldrex.p0i32(i32*)
define i32 @test_ldrex(i32* %addr) {
; CHECK-LABEL: test_ldrex:
; CHECK: ldxr w0, [x0]
  %val = call i32 @llvm.arm.ldrex.p0i32(i32* %addr)
  ret i32 %val
}

declare i32 @llvm.arm.ldaex.p0i16(i16*)
define i32 @test_ldaex(i16* %addr) {
; CHECK-LABEL: test_ldaex:
; CHECK: ldaxrh w0, [x0]
  %val = call i32 @llvm.arm.ldaex.p0i16(i16* %addr)
  ret i32 %val
}

declare i32 @llvm.arm.strex.p0i8(i32, i8*)
define i32 @test_strex(i8* %addr, i8 %val) {
; CHECK-LABEL: test_strex:
; CHECK: stxrb w[[TMP:[0-9]+]], w1, [x0]
; CHECK: mov x0, x[[TMP]]
  %val32 = zext i8 %val to i32
  %success = call i32 @llvm.arm.strex.p0i8(i32 %val32, i8* %addr)
  ret i32 %success
}

declare i32 @llvm.arm.stlex.p0i32(i32, i32*)
define i32 @test_stlex(i32* %addr, i32 %val) {
; CHECK-LABEL: test_stlex:
; CHECK: stlxr w[[TMP:[0-9]+]], w1, [x0]
; CHECK: mov x0, x[[TMP]]
  %success = call i32 @llvm.arm.stlex.p0i32(i32 %val, i32* %addr)
  ret i32 %success
}

declare { i32, i32 } @llvm.arm.ldrexd(i8*)
define { i32, i32 } @test_ldrexd(i8* %addr) {
; CHECK-LABEL: test_ldrexd:
; CHECK: ldxr x0, [x0]
; CHECK: lsr x1, x0, #32

  %res = call { i32, i32 } @llvm.arm.ldrexd(i8* %addr)
  ret { i32, i32 } %res
}

declare { i32, i32 } @llvm.arm.ldaexd(i8*)
define i64 @test_ldaexd(i8* %addr) {
; CHECK-LABEL: test_ldaexd:
; CHECK: ldaxr x0, [x0]
; CHECK-NOT: bfxil

  %res.pair = call { i32, i32 } @llvm.arm.ldaexd(i8* %addr)
  %res.lo = extractvalue { i32, i32 } %res.pair, 0
  %res.hi = extractvalue { i32, i32 } %res.pair, 1

  %res.lo64 = zext i32 %res.lo to i64
  %res.hi64 = zext i32 %res.hi to i64
  %res.hi64.hi = shl i64 %res.hi64, 32

  %res = or i64 %res.lo64, %res.hi64.hi
  ret i64 %res
}

declare i32 @llvm.arm.strexd(i32, i32, i8*)
define i32 @test_strexd(i8* %addr, i32 %lo, i32 %hi) {
; CHECK-LABEL: test_strexd:
; CHECK: mov w[[VAL:[0-9]+]], w1
; CHECK: bfi x[[VAL]], x2, #32, #32
; CHECK: stxr w[[TMP:[0-9]+]], x[[VAL]], [x0]
; CHECK: mov x0, x[[TMP]]

  %success = call i32 @llvm.arm.strexd(i32 %lo, i32 %hi, i8* %addr)
  ret i32 %success
}

declare i32 @llvm.arm.stlexd(i32, i32, i8*)
define i32 @test_stlexd(i8* %addr, i32 %lo, i32 %hi) {
; CHECK-LABEL: test_stlexd:
; CHECK: mov w[[VAL:[0-9]+]], w1
; CHECK: bfi x[[VAL]], x2, #32, #32
; CHECK: stlxr w[[TMP:[0-9]+]], x[[VAL]], [x0]
; CHECK: mov x0, x[[TMP]]

  %success = call i32 @llvm.arm.stlexd(i32 %lo, i32 %hi, i8* %addr)
  ret i32 %success
}
