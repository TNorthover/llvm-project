; RUN: opt < %s -aarch64-watch-bitcode-compatibility -aarch64-stret-compat -S | FileCheck %s -check-prefix IR
; RUN: llc < %s -aarch64-watch-bitcode-compatibility | FileCheck %s -check-prefix ASM

target datalayout = "e-m:o-p:32:32-i64:64-a:0:32-n32-S128"
target triple = "arm64_32-apple-ios"

%struct.S = type { [8 x i32] }
%struct._objc_super = type { i8*, i8* }

; IR-LABEL: define void @test
; ASM-LABEL: _test:
define void @test(i8* %id, i8* %op) {
  %s = alloca %struct.S, align 4
; ASM: mov x8, sp
; ASM-NEXT: bl _objc_msgSend{{$}}
; IR: call void bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to void (%struct.S*, i8*, i8*)*)(%struct.S* sret %s, i8* %id, i8* %op)
  call void bitcast (void (i8*, i8*, ...)* @objc_msgSend_stret to void (%struct.S*, i8*, i8*)*)(%struct.S* sret %s, i8* %id, i8* %op)
  ret void
}

; IR-LABEL: define void @test_arg
; ASM-LABEL: _test_arg:
define void @test_arg(i8* %id, i8* %op, i32 %a0, i64 %a1) {
  %s = alloca %struct.S, align 4
; ASM: mov x8, sp
; ASM: bl _objc_msgSend{{$}}
; IR: call void bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to void (%struct.S*, i8*, i8*, i32, i64)*)(%struct.S* sret %s, i8* %id, i8* %op, i32 %a0, i64 %a1)
  call void bitcast (void (i8*, i8*, ...)* @objc_msgSend_stret to void (%struct.S*, i8*, i8*, i32, i64)*)(%struct.S* sret %s, i8* %id, i8* %op, i32 %a0, i64 %a1)
  ret void
}

; IR-LABEL: define void @test_attrs
; ASM-LABEL: _test_attrs:
define void @test_attrs(i8* %id, i8* %op) {
  %s = alloca %struct.S, align 4
; ASM: mov x8, sp
; ASM-NEXT: bl _objc_msgSend{{$}}
; IR: call void bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to void (%struct.S*, i8*, i8*)*)(%struct.S* nonnull sret %s, i8* %id, i8* %op) [[NUWATTR:#[0-9]+]]
  call void bitcast (void (i8*, i8*, ...)* @objc_msgSend_stret to void (%struct.S*, i8*, i8*)*)(%struct.S* nonnull sret %s, i8* %id, i8* %op) nounwind
  ret void
}

; IR-LABEL: define void @test_Super2
; ASM-LABEL: _test_Super2:
define void @test_Super2(%struct._objc_super* %super, i8* %op, i32 %a0, i64 %a1) {
  %s = alloca %struct.S, align 4
; ASM: bl _objc_msgSendSuper2{{$}}
; IR: call void bitcast (i8* (%struct._objc_super*, i8*, ...)* @objc_msgSendSuper2 to void (%struct.S*, %struct._objc_super*, i8*, i32, i64)*)(%struct.S* sret %s, %struct._objc_super* %super, i8* %op, i32 %a0, i64 %a1)
  call void bitcast (void (i8*, %struct._objc_super*, i8*, ...)* @objc_msgSendSuper2_stret to void (%struct.S*, %struct._objc_super*, i8*, i32, i64)*)(%struct.S* sret %s, %struct._objc_super* %super, i8* %op, i32 %a0, i64 %a1)
  ret void
}

; IR-LABEL: define void @test_Super
; ASM-LABEL: _test_Super:
define void @test_Super(%struct._objc_super* %super, i8* %op, i32 %a0, i64 %a1) {
  %s = alloca %struct.S, align 4
; ASM: bl _objc_msgSendSuper{{$}}
; IR: call void bitcast (i8* (%struct._objc_super*, i8*, ...)* @objc_msgSendSuper to void (%struct.S*, %struct._objc_super*, i8*, i32, i64)*)(%struct.S* sret %s, %struct._objc_super* %super, i8* %op, i32 %a0, i64 %a1)
  call void bitcast (void (i8*, %struct._objc_super*, i8*, ...)* @objc_msgSendSuper_stret to void (%struct.S*, %struct._objc_super*, i8*, i32, i64)*)(%struct.S* sret %s, %struct._objc_super* %super, i8* %op, i32 %a0, i64 %a1)
  ret void
}

; Make sure that 1) we don't muck with objc_msgSend, and 2) that we can reuse
; existing declarations.

; IR-LABEL: define void @test_noop
; ASM-LABEL: _test_noop:
define void @test_noop(i8* %id, i8* %op, i8* %a0) {
; ASM: bl _objc_msgSend{{$}}
; IR: call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*, i8*)*)(i8* %id, i8* %op, i8* %a0)
  call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*, i8*)*)(i8* %id, i8* %op, i8* %a0)
  ret void
}

; IR-LABEL: define {{.*}} @test_noncall
; ASM-LABEL: _test_noncall:
define i8*(%struct._objc_super*, i8*, ...)* @test_noncall(i8* %id, i8* %op, i1 %which) {
  %s = alloca %struct.S, align 4
; ASM-NOT: _objc_msgSendSuper_stret
; ASM: adrp x[[PAGE:[0-9]+]], _objc_msgSendSuper@GOTPAGE
; ASM: ldr w0, [x[[PAGE]], _objc_msgSendSuper@GOTPAGEOFF]
; ASM-NOT: _objc_msgSendSuper_stret
; IR: select i1 %which, i8* (%struct._objc_super*, i8*, ...)* @objc_msgSendSuper, i8* (%struct._objc_super*, i8*, ...)* @objc_msgSendSuper
  %func = select i1 %which, i8*(%struct._objc_super*, i8*, ...)* @objc_msgSendSuper, i8*(%struct._objc_super*, i8*, ...)* bitcast(void(i8*, %struct._objc_super*, i8*, ...)* @objc_msgSendSuper_stret to i8*(%struct._objc_super*, i8*, ...)*)
  ret i8*(%struct._objc_super*, i8*, ...)* %func
}

; IR-LABEL: define void @test_forward
; ASM-LABEL: _test_forward:
define void @test_forward(i8* %id, i8* %op) {
  %s = alloca %struct.S, align 4
; ASM: mov x8, sp
; ASM-NEXT: bl _objc_msgForward{{$}}
; IR: call void bitcast (void (i8*, i8*, ...)* @objc_msgForward to void (%struct.S*, i8*, i8*)*)(%struct.S* sret %s, i8* %id, i8* %op)
  call void bitcast (void (i8*, i8*, ...)* @objc_msgForward_stret to void (%struct.S*, i8*, i8*)*)(%struct.S* sret %s, i8* %id, i8* %op)
  ret void
}


declare i8* @objc_msgSend(i8*, i8*, ...) nonlazybind

declare void @objc_msgSend_stret(i8*, i8*, ...)
declare void @objc_msgSendSuper_stret(i8*, %struct._objc_super*, i8*, ...)
declare void @objc_msgSendSuper2_stret(i8*, %struct._objc_super*, i8*, ...)
declare void @objc_msgForward_stret(i8*, i8*, ...)

declare i8* @objc_msgSendSuper(%struct._objc_super*, i8*, ...)
declare i8* @objc_msgSendSuper2(%struct._objc_super*, i8*, ...)

; IR-DAG: declare i8* @objc_msgSend(i8*, i8*, ...) [[NLBATTR:#[0-9]]]
; IR-DAG: declare i8* @objc_msgSendSuper(%struct._objc_super*, i8*, ...){{$}}
; IR-DAG: declare i8* @objc_msgSendSuper2(%struct._objc_super*, i8*, ...){{$}}

; IR-DAG: attributes [[NLBATTR]] = { nonlazybind }
; IR-DAG: attributes [[NUWATTR]] = { nounwind }
