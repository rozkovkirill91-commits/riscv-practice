# Print min(x,y), min(x,y)+h, ... while value <= max(x,y).
.include "params.inc"
.text
.globl main
main:
    li a7, 5
    ecall
    mv t0, a0                # Current value
    li t1, GROUP_NUMBER      # Upper bound
    li t2, STUDENT_NUMBER    # Positive step h
    bge t1, t0, loop
    mv t3, t0
    mv t0, t1
    mv t1, t3
loop:
    mv a0, t0
    li a7, 1
    ecall
    li a0, 10
    li a7, 11
    ecall
    sub t3, t1, t0           # Unsigned distance to upper bound
    bltu t3, t2, done        # Avoid signed overflow and overshoot
    add t0, t0, t2
    j loop
done:
    li a7, 10
    ecall
