// RUN: llvm-mc -triple arm64_32-apple-watchos %s -filetype=obj -o %t
// RUN: llvm-objdump -macho -d %t | FileCheck %s

// CHECK: ldr x0, [x2]
ldr x0, [x2]
