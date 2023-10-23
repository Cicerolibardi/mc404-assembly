.globl _start
.set loc_base, 0xFFFF0100

_start:
    li a0, loc_base

    li t0, -60
    sb t0, 0x20(a0)

    li t1, 1
    sb t1, 0x21(a0)
    
    li t2, 0
    li t3, 8000
    
    loop_andar:
        bge t2, t3, end_loop_andar
        addi t2, t2, 1
        j loop_andar

    end_loop_andar:

    li t1, -1
    sb t1, 0x21(a0)

    li t1, 1
    sb t1, 0(a0)

    loop_gps:
        lb t5, 0(a0)
        bne t5, zero, loop_gps

    li a0, 0
    li a7, 93
    ecall

