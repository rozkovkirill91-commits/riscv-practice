# Read up to 16+n integers, stopping immediately after storing zero.
.include "params.inc"
.data
.align 2
array: .space ARRAY_BYTES
count: .word 0               # Number of stored elements, including zero
.text
.globl main
main:
    la t0, array
    li t1, ARRAY_LENGTH
    li t2, 0
read_loop:
    bge t2, t1, done
    li a7, 5
    ecall
    sw a0, 0(t0)
    addi t0, t0, 4
    addi t2, t2, 1
    bnez a0, read_loop
done:
    la t3, count
    sw t2, 0(t3)
    li a7, 10
    ecall
