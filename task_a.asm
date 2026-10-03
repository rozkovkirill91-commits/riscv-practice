# Read x and print 1 if x equals the student number, otherwise 0.
.include "params.inc"
.text
.globl main
main:
    li a7, 5                 # ReadInt -> a0
    ecall
    li t0, STUDENT_NUMBER
    sub t1, a0, t0
    seqz a0, t1              # a0 = (x == STUDENT_NUMBER)
    li a7, 1                 # PrintInt
    ecall
    li a0, 10
    li a7, 11                # PrintChar: newline
    ecall
    li a7, 10                # Exit
    ecall
