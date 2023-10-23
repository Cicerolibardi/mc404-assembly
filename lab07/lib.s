.globl puts
.globl gets
.globl atoi
.globl itoa
.globl time
.globl sleep
.globl approx_sqrt
.globl imageFilter
.globl exit

.text
puts:
    mv t1, a0

    loop_puts:
        lb t3, 0(t1)
        beq t3, zero, end_loop_puts

        li a0, 1            # file descriptor = 1 (stdout)
        mv a1, t1
        li a2, 1            # size
        li a7, 64           # syscall write (64)
        ecall

        addi t1, t1, 1
        j loop_puts

    end_loop_puts:
        li t0, '\n'
        addi sp, sp, -1
        sw t0, 0(sp)

        mv a1, sp
        li a2, 1            # size
        li a7, 64           # syscall write (64)
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
        li a7, 63 # syscall read (63)
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


imageFilter:
    #a0 é a imagem
    #a1 é a largura
    #a2 é a altura
    #a3 é a matriz de filtro

    mv a4, a0
    addi sp, sp, -32
    sw s1, 20(sp)
    sw s2, 16(sp)
    sw s3, 12(sp)
    sw s4, 8(sp)
    sw s5, 4(sp)
    sw s6, 0(sp)
    
    mv a7, sp
    addi a7, a7, -4

    li t0, 0
    loop_linhas:
        li t1, 0
        
        bge t0, a2, end_loop_linhas

        loop_colunas:
            bge t1, a1, end_loop_colunas # t1 vai ser a coluna que está sendo executada
            mv t3, zero                  # t3 vai ser a linha que está sendo executada (posição no vetor enorme)

            mul t4, t0, a1
            add t3, t1, t4

            add s1, a4, t3              # colocando em s1 o endereço de a4 + t3 para poder dar load no byte.

            beq t1, zero, casos_borda
            beq t0, zero, casos_borda
            
            addi s4, a1, -1
            beq t1, s4, casos_borda

            addi s4, a2, -1
            beq t0, s4, casos_borda
            
            casos_geral:
                li s2, 0

                sub s4, s1, a1
                addi s4, s4, -1

                lbu s5, 0(s4)
                lbu s3, 0(a3)
                mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
                add s2, s2, s6

                addi s4, s4, 1
                addi a3, a3, 1

                lbu s5, 0(s4)
                lbu s3, 0(a3)
                mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
                add s2, s2, s6

                addi s4, s4, 1
                addi s3, s3, 1

                lbu s5, 0(s4)
                lbu s3, 0(a3)
                mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
                add s2, s2, s6

                mv s4, s1
                addi s4, s4, -1
                addi s3, s3, 1

                lbu s5, 0(s4)
                lbu s3, 0(a3)
                mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
                add s2, s2, s6

                addi s4, s4, 1 #pulando o pixel de valor 8 que será feito no final
                addi s3, s3, 1

                lbu s5, 0(s4)
                lbu s3, 0(a3)
                mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
                add s2, s2, s6

                addi s4, s4, 1 #pulando o pixel de valor 8 que será feito no final
                addi s3, s3, 1

                lbu s5, 0(s4)
                lbu s3, 0(a3)
                mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
                add s2, s2, s6

                add s4, s1, a1
                addi s4, s4, -1
                addi s3, s3, 1

                lbu s5, 0(s4)
                lbu s3, 0(a3)
                mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
                add s2, s2, s6

                addi s4, s4, 1
                addi s3, s3, 1

                lbu s5, 0(s4)
                lbu s3, 0(a3)
                mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
                add s2, s2, s6

                addi s4, s4, 1
                addi s3, s3, 1

                lbu s5, 0(s4)
                lbu s3, 0(a3)
                mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
                add s2, s2, s6

                addi a3, a3, -8
                
                j verificar_cor
                
            casos_borda:
                mv s2, zero
                j guardar_pilha

            verificar_cor:
                li s3, 256
                bge s2, s3, mudar_branco
                blt s2, zero, mudar_preto 

                j guardar_pilha

            mudar_branco:
                li s2, 255
                j guardar_pilha

            mudar_preto:
                li s2, 0
                j guardar_pilha

            guardar_pilha:
                addi sp, sp, -1
                sb s2, 0(sp)
            
            j loop_colunas

    end_loop_colunas:
        addi t0, t0, 1
        j loop_linhas

    end_loop_linhas:

    mul a3, a1, a2
    li t0, 0
    mv a4, a7

    desempilhar:
        beq a3, t0, fim_desempilhar
        lbu a2, 0(a4)
        sb a2, 0(a0)
        addi a4, a4, -1
        addi t0, t0, 1
        addi a0, a0, 1

    fim_desempilhar:
    add sp, sp, a3

    lw s6, 0(sp)
    lw s5, 4(sp)
    lw s4, 8(sp)
    lw s3, 12(sp)
    lw s2, 16(sp)
    lw s1, 20(sp)
    addi sp, sp, 32

    ret


time:
    #alocando espaço para os buffers timeval e timezone
    addi sp, sp, -16
    mv a1, sp
    addi sp, sp, -16
    mv a0, sp

    #empilhando pois essa ecall gera problema.
    addi sp, sp, -8
    sw a1, 0(sp)
    sw a0, 4(sp)

    li a7, 169
    ecall

    lw a0, 4(sp)
    lw a1, 0(sp)

    lw t1, 0(a0) # tempo em segundos
    lw t2, 8(a0) # fração do tempo em microssegundos
    li t3, 1000
    
    mul t1, t1, t3
    div t2, t2, t3
    add a0, t2, t1

    addi sp, sp, 40
    ret


sleep: 

    addi sp, sp , -4
    sw ra, 0(sp)

    addi sp, sp, -4
    sw a0, 0(sp)

    call time

    mv t0, a0 # tempo inicial que foi pego

    loop_sleep:
        call time

        mv t1, a0

        sub t2, t1, t0
        lw t3, 0(sp)
        bge t3, t2, loop_sleep

    addi sp, sp, 4
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

exit:
    mv a7, a0
    ecall
    ret