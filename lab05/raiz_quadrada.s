.text

.globl _start

calcular_raiz:    
    li a0, 0 # file descriptor = 0 (stdin)
    la a1, input_adress #  buffer
    li a2, 5 # size (lendo apenas 1 byte, mas tamanho é variável)
    li a7, 63 # syscall read (63)
    ecall

    addi a2, zero, 0
    
    mv a0, zero
    lb a0, 0(a1)
    addi a0, a0, -'0'
    li t0, 1000
    mul a0, t0, a0
    add a2, a2, a0
    
    mv a0, zero
    lb a0, 1(a1)
    addi a0, a0, -'0'
    li t0, 100
    mul a0, t0, a0
    add a2, a2, a0
    
    mv a0, zero
    lb a0, 2(a1)
    addi a0, a0, -'0'
    li t0, 10
    mul a0, t0, a0
    add a2, a2, a0

    mv a0, zero
    lb a0, 3(a1)
    addi a0, a0, -'0'
    add a2, a2, a0 # a2 é o lugar aonde soma-se os valores para ter-se um inteiro

    li t1, 2
    div a3, a2, t1 # a3 é k na iteração, também é o chute inicial do programa
    
    li s1, 10
    li s0, -1
metodo_babilonico:
    div a4, a2, a3 # a4 é o valor de y/k na formula, no caso, y é a2 e k é a3.
    add a5, a3, a4 # a5 é o valor de y/k + k
    div a3, a5, t1 # a3 é o k' na iteração
    addi s0, s0, 1
    blt s0, s1, metodo_babilonico

    la a1, string
    li t4, 1000
    div t2, a3, t4
    addi t2, t2, '0'
    sb t2, 0(a1)
    rem a3, a3, t4

    li t4, 100
    div t2, a3, t4
    addi t2, t2, '0'
    sb t2, 1(a1)
    rem a3, a3, t4

    li t4, 10
    div t2, a3, t4
    addi t2, t2, '0'
    sb t2, 2(a1)
    rem a3, a3, t4

    li t4, 1
    div t2, a3, t4
    addi t2, t2, '0'
    sb t2, 3(a1)
    rem a3, a3, t4

imprime:
    li a0, 1            # file descriptor = 1 (stdout)
    la a1, string       # buffer
    li a2, 4            # size
    li a7, 64           # syscall write (64)
    ecall

    li a0, 1            # file descriptor = 1 (stdout)
    la a1, string       # buffer
    addi t0, zero, ' '
    sb t0, 0(a1)
    li a2, 1            # size
    li a7, 64           # syscall write (64)
    ecall
    
    ret

_start:
    call calcular_raiz
    call calcular_raiz
    call calcular_raiz
    call calcular_raiz
    li a0, 1            # file descriptor = 1 (stdout)
    la a1, string       # buffer
    addi t0, zero, '\n'
    sb t0, 0(a1)
    li a2, 1            # size
    li a7, 64           # syscall write (64)
    ecall

.data
input_adress: .skip 0x10  # buffer
string: .skip 0x5

