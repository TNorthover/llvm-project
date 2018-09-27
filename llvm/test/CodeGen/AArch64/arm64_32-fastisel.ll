; RUN: llc -mtriple=arm64_32-apple-ios -O0 -fast-isel -fast-isel-abort=1 %s -o - | FileCheck %s

@var = global i8* null

define void @test_store_release_ptr() {
; CHECK-LABEL: test_store_release_ptr
; CHECK: mov {{w|x}}[[ZERO:[0-9]+]], {{w|x}}zr
; CHECK: stlr w[[ZERO]]
  store atomic i8* null, i8** @var release, align 4
  br label %next

next:
  ret void
}

declare [2 x i32] @callee()

define void @test_struct_return(i32* %addr) {
; CHECK-LABEL: test_struct_return:
; CHECK: bl _callee
; CHECK: lsr [[HI:x[0-9]+]], x0, #32
; CHECK: mov [[LO:w[0-9]+]], w0
  %res = call [2 x i32] @callee()
  %res.0 = extractvalue [2 x i32] %res, 0
  store i32 %res.0, i32* %addr
  %res.1 = extractvalue [2 x i32] %res, 1
  store i32 %res.1, i32* %addr
  ret void
}

define i8* @test_ret_ptr(i64 %in) {
; CHECK-LABEL: test_ret_ptr:
; CHECK: add [[TMP:x[0-9]]], x0, #1
; CHECK: and x0, [[TMP]], #0xffffffff

  %sum = add i64 %in, 1
  %res = inttoptr i64 %sum to i8*
  ret i8* %res
}

; Handled by SDAG because the struct confuses FastISel, which is fine.
define {i8*} @test_ret_ptr_struct(i64 %in) {
; CHECK-LABEL: test_ret_ptr_struct:
; CHECK: add {{w[0-9]+}}, {{w[0-9]+}}, #1

  %sum = add i64 %in, 1
  %res.ptr = inttoptr i64 %sum to i8*
  %res = insertvalue {i8*} undef, i8* %res.ptr, 0
  ret {i8*} %res
}


define void @test_pointer_call(i64 %in) {
; CHECK-LABEL: test_pointer_call:
; CHECK: and x0, x0, #0xffffffff
; CHECK: bl _test_struct_return

  ; Call a random function taking a pointer. Ignore the name.
  %ptr = inttoptr i64 %in to i32*
  call void @test_struct_return(i32* %ptr)
  ret void
}

define void @test_stack_pointer_call() {
; CHECK-LABEL: test_stack_pointer_call:
; CHECK: add x[[VAR:[0-9]+]], sp, #
; CHECK: mov [[VAR_TMP:w[0-9]+]], w[[VAR]]
; CHECK: str [[VAR_TMP]], [sp]
; CHECK: mov [[VAR_TMP:w[0-9]+]], w[[VAR]]
; CHECK: str [[VAR_TMP]], [sp, #4]

  %var = alloca i8
  call i8* @test_stack_pointer_arg(i64 undef, i64 undef, i64 undef, i64 undef,
                                   i64 undef, i64 undef, i64 undef, i64 undef,
                                   i8* %var, i8* %var)
  ret void
}

define i8* @test_stack_pointer_arg(i64, i64, i64, i64, i64, i64, i64, i64, i8* %in1, i8* %in2) {
; CHECK-LABEL: test_stack_pointer_arg:
; CHECK: ldr [[IN1:w[0-9]+]], [sp]
; CHECK: mov w[[IN1_TMP:[0-9]+]], [[IN1]]
; CHECK: and x0, x[[IN1_TMP]], #0xffffffff

  ret i8* %in1
}

define i8* @test_load_ptr(i8** %addr) {
; CHECK-LABEL: test_load_ptr:
; CHECK: ldr [[VAL:w[0-9]+]], [x0, #12]
; CHECK: mov w[[TMP:[0-9]+]], [[VAL]]
; CHECK: and x0, x[[TMP]], #0xffffffff

  %elt = getelementptr i8*, i8** %addr, i64 3
  %val = load i8*, i8** %elt
  ret i8* %val
}

define i64 @test_ext_load(i32* %addr) {
; CHECK-LABEL: test_ext_load:
; CHECK: ldrsw x0, [x0]

  %val = load i32, i32* %addr
  %res = sext i32 %val to i64
  ret i64 %res
}

define void @test_store_ptr(i8* %in, i8** %addr) {
; CHECK-LABEL: test_store_ptr:
; CHECK: str w0, [x1, #12]

  %elt = getelementptr i8*, i8** %addr, i64 3
  store i8* %in, i8** %elt
  ret void
}

define i8* @test_gep(i8* %in) {
; CHECK-LABEL: test_gep:
; CHECK: add [[SUM:x[0-9]+]], x0, #12
; CHECK: and [[MASK:x[0-9]+]], [[SUM]], #0xffffffff
; CHECK: and x0, [[MASK]], #0xffffffff
  %res = getelementptr i8, i8* %in, i32 12
  ret i8* %res
}

define i8* @test_gep_inbounds(i8* %in) {
; CHECK-LABEL: test_gep_inbounds:
; CHECK: add [[SUM:x[0-9]+]], x0, #12
; CHECK: and x0, [[SUM]], #0xffffffff
; CHECK-NEXT: ret
%res = getelementptr inbounds i8, i8* %in, i32 12
  ret i8* %res
}

define i1 @test_cmp_bitfield(i8* %in) {
; CHECK-LABEL: test_cmp_bitfield:
; CHECK: ubfx x0, x0, #31, #1

  %tst = icmp slt i8* %in, null
  ret i1 %tst
}

declare void @foo()
declare void @bar()
define void @test_cmp_cbnz(i8* %in) {
; CHECK-LABEL: test_cmp_cbnz:
; CHECK: mov [[TMP:w[0-9]+]], w0
; CHECK: cbnz [[TMP]]

  %tst = icmp eq i8* %in, null
  br i1 %tst, label %true, label %false

true:
  call void @foo()
  ret void

false:
  call void @bar()
  ret void
}

define void @test_cmp_imm(i8* %in) {
; CHECK-LABEL: test_cmp_imm:
; CHECK: mov [[TMP:w[0-9]+]], w0
; CHECK: subs {{w[0-9]+}}, [[TMP]], #41
; CHECK: b.hi

  %tst = icmp ult i8* %in, inttoptr(i32 42 to i8*)
  br i1 %tst, label %true, label %false

true:
  call void @foo()
  ret void

false:
  call void @bar()
  ret void
}

define void @test_cmp_reg(i8* %lhs, i8* %rhs) {
; CHECK-LABEL: test_cmp_reg:
; CHECK: mov [[LHS:w[0-9]+]], w0
; CHECK: mov [[RHS:w[0-9]+]], w1
; CHECK: cmp [[LHS]], [[RHS]]
; CHECK: b.hs

  %tst = icmp ult i8* %lhs, %rhs
  br i1 %tst, label %true, label %false

true:
  call void @foo()
  ret void

false:
  call void @bar()
  ret void
}

define i8* @test_select_ptr(i1 %tst, i8* %lhs, i8* %rhs) {
; CHECK-LABEL: test_select_ptr:
; CHECK: tst w0, #0
; CHECK: csel [[TMP:x[0-9]+]], x1, x2, ne
; CHECK: and x0, [[TMP]], #0xffffffff
  %res = select i1 %tst, i8* %lhs, i8* %rhs
  ret i8* %res
}
