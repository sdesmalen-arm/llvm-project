# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=riscv64-unknown-unknown -mcpu=syntacore-scr7 --iterations=1 < %s | FileCheck %s --check-prefixes=CHECK

fmul.s f1, f1, f2

fadd.s f2, f2, f5
fadd.s f3, f3, f5
fadd.s f4, f4, f5

fmul.s f6, f6, f7

fadd.s f7, f7, f5
fadd.s f8, f8, f5
fadd.s f9, f9, f5

fmadd.s f1, f1, f2, f4
fdiv.s f3, f3, f5

# CHECK:      Iterations:        1
# CHECK-NEXT: Instructions:      10
# CHECK-NEXT: Total Cycles:      28
# CHECK-NEXT: Total uOps:        10

# CHECK:      Dispatch Width:    2
# CHECK-NEXT: uOps Per Cycle:    0.36
# CHECK-NEXT: IPC:               0.36
# CHECK-NEXT: Block RThroughput: 15.0

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      6     1.00                        fmul.s	ft1, ft1, ft2
# CHECK-NEXT:  1      4     1.00                        fadd.s	ft2, ft2, ft5
# CHECK-NEXT:  1      4     1.00                        fadd.s	ft3, ft3, ft5
# CHECK-NEXT:  1      4     1.00                        fadd.s	ft4, ft4, ft5
# CHECK-NEXT:  1      6     1.00                        fmul.s	ft6, ft6, ft7
# CHECK-NEXT:  1      4     1.00                        fadd.s	ft7, ft7, ft5
# CHECK-NEXT:  1      4     1.00                        fadd.s	fs0, fs0, ft5
# CHECK-NEXT:  1      4     1.00                        fadd.s	fs1, fs1, ft5
# CHECK-NEXT:  1      6     1.00                        fmadd.s	ft1, ft1, ft2, ft4
# CHECK-NEXT:  1      16    15.00                       fdiv.s	ft3, ft3, ft5

# CHECK:      Resources:
# CHECK-NEXT: [0]   - SCR7_ALU_DIV_IS
# CHECK-NEXT: [1]   - SCR7_ALU_MUL_IS
# CHECK-NEXT: [2]   - SCR7_DIV
# CHECK-NEXT: [3]   - SCR7_FALU
# CHECK-NEXT: [4]   - SCR7_FDIVSQRT
# CHECK-NEXT: [5]   - SCR7_FMA
# CHECK-NEXT: [6]   - SCR7_FPU_IS
# CHECK-NEXT: [7]   - SCR7_LSU
# CHECK-NEXT: [8]   - SCR7_MUL

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]
# CHECK-NEXT:  -      -      -     6.00   15.00  3.00   10.00   -      -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    Instructions:
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -      -     fmul.s	ft1, ft1, ft2
# CHECK-NEXT:  -      -      -     1.00    -      -     1.00    -      -     fadd.s	ft2, ft2, ft5
# CHECK-NEXT:  -      -      -     1.00    -      -     1.00    -      -     fadd.s	ft3, ft3, ft5
# CHECK-NEXT:  -      -      -     1.00    -      -     1.00    -      -     fadd.s	ft4, ft4, ft5
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -      -     fmul.s	ft6, ft6, ft7
# CHECK-NEXT:  -      -      -     1.00    -      -     1.00    -      -     fadd.s	ft7, ft7, ft5
# CHECK-NEXT:  -      -      -     1.00    -      -     1.00    -      -     fadd.s	fs0, fs0, ft5
# CHECK-NEXT:  -      -      -     1.00    -      -     1.00    -      -     fadd.s	fs1, fs1, ft5
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -      -     fmadd.s	ft1, ft1, ft2, ft4
# CHECK-NEXT:  -      -      -      -     15.00   -     1.00    -      -     fdiv.s	ft3, ft3, ft5
