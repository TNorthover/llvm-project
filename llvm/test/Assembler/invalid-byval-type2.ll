; RUN: not llvm-as %s -o /dev/null 2>&1 | FileCheck %s

; CHECK: error: expected '(<ty>)' after byval keyword
declare void @foo(i32* byval(void))
