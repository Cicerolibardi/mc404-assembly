.globl set_motor
.globl set_handbreak
.globl read_camera
.globl read_sensor_distance
.globl get_position
.globl get_rotation
.globl get_time
.globl filter_1d_image
.globl display_image
.globl puts
.globl gets
.globl atoi
.globl itoa
.globl sleep
.globl approx_sqrt


.data
buffer: .skip 256
.text


set_motor:
    li a7, 10
    ecall
    ret

set_handbreak:
    li a7, 11
    ecall
    ret

read_camera:
    li a7, 12
    ecall
    ret

read_sensor_distance:
    li a7, 13
    ecall
    ret

get_position:
    li a7, 15
    ecall
    ret

get_rotation:
    li a7, 16
    ecall
    ret

get_time:
    li a7, 20
    ecall
    ret

atoi:
    mv t0, a0
    li t2, ' '
    loop_remover_espacos:
        lb t1, 0(t0)
        addi t0, t0, 1
        beq t1, t2, loop_remover_espacos

    addi t0, t0, -1

    li t2, '-'
    lb t3, 0(t0)

    mv t1, t0 #copiando para fazer o stringlen

    li t4, 0 #t4 será o tamanho da string
    li t5, 1
    li t6, 10
    
    bne t3, t2, strlen
    
    li t2, 1   #setando que o número é um número negativo
    addi t0, t0, 1
    addi t1, t1, 1

    strlen:
        lb t3, 0(t1)
        beq t3, zero, strlen_end
        addi t1, t1, 1
        addi t4, t4, 1
        mul t5, t5, t6
        j strlen

    strlen_end:

    div t5, t5, t6

    #t0 está a posição atual do vetor já shiftado sem espaços e '-'
    #t4 está o tamanho da string (strlen)

    mv a0, zero
    li t1, '0'
    li a6, '9'
    loop_atoi:
        mv a1, zero
        lb a1, 0(t0)
        beq a1, zero, end_loop_atoi

        #verificando se não é um caractere inteiro
        blt a1, t1, end_loop_atoi
        blt a6, a1, end_loop_atoi

        addi a1, a1, -'0'
        mul a1, t5, a1
        add a0, a0, a1
        div t5, t5, t6

        addi t0, t0, 1

        j loop_atoi
    
    end_loop_atoi:
    li a7, 1
    bne t2, a7, finalizar_atoi
    li a7, -1
    mul a0, a0, a7

    finalizar_atoi:

    ret


itoa:
    mv t0, a0

    li t3, 0 #contar quantidade de vezes que empilha algo

    li t1, 10
    beq a2, t1, itoa_10

    li t1, 16
    li t4, 9
    j itoa_16

    itoa_10:
        beq t0, zero, verificar_sinal_itoa
        rem t2, t0, t1
        addi t2, t2, '0'
        div t0, t0, t1

        addi sp, sp, -1
        sb t2, 0(sp)
        addi t3, t3, 1
        j itoa_10

    itoa_16:
        beq t0, zero, verificar_sinal_itoa
        rem t2, t0, t1

        blt t4, t2, colocar_letra
        
        addi t2, t2, '0'
        j continuar_itoa16

        colocar_letra:
            addi t2, t2, -10
            addi t2, t2, 'a'
            j continuar_itoa16

        continuar_itoa16:

        srli t0, t0, 4

        addi sp, sp, -1
        sb t2, 0(sp)
        addi t3, t3, 1
        j itoa_16

    verificar_sinal_itoa:

    li t1, 10
    bne a2, t1, desempilhar_itoa
    bge a0, zero, desempilhar_itoa

    li t1, '-'
    addi sp, sp, -1
    sb t1, 0(sp)
    addi t3, t3, 1

    li t5, 0
    desempilhar_itoa:
        bge t5, t3, end_itoa

        lb t1, 0(sp)
        addi sp, sp, 1
        sb t1, 0(a1)

        addi a1, a1, 1
        addi t5, t5, 1
        j desempilhar_itoa

    end_itoa:
    sb zero, 0(a1)
    sub a1, a1, t5
    mv a0, a1
    ret

puts:
    mv t1, a0

    loop_puts:
        lb t3, 0(t1)
        beq t3, zero, end_loop_puts

        li a0, 1            # file descriptor = 1 (stdout)
        mv a1, t1
        li a2, 1            # size
        li a7, 18           # syscall write (64)
        ecall

        addi t1, t1, 1
        j loop_puts

    end_loop_puts:
        li t0, '\n'
        addi sp, sp, -1
        sw t0, 0(sp)

        mv a1, sp
        li a2, 1            # size
        li a7, 18           # syscall write (64)
        ecall

        addi sp, sp, 1

    ret

gets:
    mv t0, a0
    mv t1, a0

    li t4, 0x05
    li t5, '\n'
    loop_gets:

        li a0, 0 # file descriptor = 0 (stdin)
        mv a1, t0 #  buffer
        li a2, 1 # size (lendo apenas 1 byte, mas tamanho é variável)
        li a7, 17 # syscall read (63)
        ecall

        lb t2, 0(t0)
        beq t2, t4, end_loop_gets
        beq t2, t5, end_loop_gets

        sb t2, 0(t0)
        addi t0, t0, 1
        j loop_gets
        
    end_loop_gets:

    sb zero, 0(t0)
    
    mv a0, t1
    ret


approx_sqrt:
    #a0 é o número
    #a1 é a quantidade de iterações

    mv a2, a0
    li t1, 2
    div a3, a2, t1 # a3 é k na iteração, também é o chute inicial do programa

    li t0, -1
    metodo_babilonico:
        div a4, a2, a3 # a4 é o valor de y/k na formula, no caso, y é a2 e k é a3.
        add a5, a3, a4 # a5 é o valor de y/k + k
        div a3, a5, t1 # a3 é o k' na iteração
        addi t0, t0, 1
        blt t0, a1, metodo_babilonico

    mv a0, a3
    ret

sleep: 
    addi sp, sp , -4
    sw ra, 0(sp)

    addi sp, sp, -4
    sw a0, 0(sp)

    call get_time

    mv t0, a0 # tempo inicial que foi pego

    loop_sleep:
        call get_time

        mv t1, a0

        sub t2, t1, t0
        lw t3, 0(sp)
        bge t3, t2, loop_sleep

    addi sp, sp, 4
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

filter_1d_image:
    #a0 é a imagem
    #a1 é a matriz de filtro

    mv a4, a0
    addi sp, sp, -32
    sw s1, 20(sp)
    sw s2, 16(sp)
    sw s3, 12(sp)
    sw s4, 8(sp)
    sw s5, 4(sp)
    sw s6, 0(sp)

    mv s1, sp

    li t0, 0
    li t1, 256
    li t2, 255

    loop_linhas:
        bge t0, t1, end_loop_linhas

        beq t0, zero, casos_borda
        beq t0, t2, casos_borda

        casos_geral:
            lbu t3, -1(a4)
            lb t4, 0(a1)
            mul t5, t3, t4

            lbu t3, 0(a4)
            lb t4, 1(a1)
            mul t6, t3, t4

            add t5, t5, t6

            lbu t3, 1(a4)
            lb t4, 2(a1)
            mul t6, t3, t4

            add t5, t5, t6

            j verificar_cor

        casos_borda:
                mv t5, zero
                j guardar_pilha

            verificar_cor:
                bge t5, t1, mudar_branco
                blt t5, zero, mudar_preto 

                j guardar_pilha

            mudar_branco:
                mv t5, t2
                j guardar_pilha

            mudar_preto:
                mv t5, zero
                j guardar_pilha

            guardar_pilha:
                addi sp, sp, -1
                sb t5, 0(sp)
            
        addi t0, t0, 1
        addi a4, a4, 1
        j loop_linhas

    end_loop_linhas:

    mv sp, s1
    mv a4, s1
    addi a4, a4, -1

    mv t1, a0
    li t0, 0
    li a3, 256

    desempilhar:
        bge t0, a3, fim_desempilhar
        lbu a2, 0(a4)
        sb a2, 0(t1)
        addi a4, a4, -1
        addi t0, t0, 1
        addi t1, t1, 1
        j desempilhar
    
    fim_desempilhar:

    lw s6, 0(sp)
    lw s5, 4(sp)
    lw s4, 8(sp)
    lw s3, 12(sp)
    lw s2, 16(sp)
    lw s1, 20(sp)
    addi sp, sp, 32

    ret

display_image: