.data
input_file: .asciz "imagem.pgm"
input_adress: .skip 262159  # buffer
ler_dados: .skip 4

.globl _start


ler_tamanho_imagem:
    #Lendo caracteres do tamanho da imagem
    mv a0, s0 # file descriptor = 0 (stdin)
    la a1, ler_dados #  buffer
    li a2, 1 # size (lendo apenas 1 byte, mas tamanho é variável)
    li a7, 63 # syscall read (63)
    ecall

    # Carregando o caractere que foi lido para comparar abaixo
    la t0, ler_dados
    lb a1, 0(t0)

    #Verifica se é algum caractere que não é válido
    li t1, ' '
    li t2, '\n'
    beq a1, t1, end_ler_tamanho_imagem
    beq a1, t2, end_ler_tamanho_imagem

    #Faz a adição 
    li t3, 10
    addi a1, a1, -'0'
    mul a3, a3, t3
    add a3, a3, a1

    j ler_tamanho_imagem

end_ler_tamanho_imagem:
    ret

_start:
    la a0, input_file    # endereço do caminho para o arquivo
    li a1, 0             # flags (0: rdonly, 1: wronly, 2: rdwr)
    li a2, 0             # modo
    li a7, 1024          # syscall open 
    ecall

    mv s0, a0

    #Lendo a linha P5 da imagem
    mv a0, s0 # file descriptor = 0 (stdin)
    la a1, ler_dados #  buffer
    li a2, 3 # size (lendo apenas 1 byte, mas tamanho é variável)
    li a7, 63 # syscall read (63)
    ecall

    li a3, 0
    call ler_tamanho_imagem
    mv a6, a3

    li a3, 0
    call ler_tamanho_imagem
    mv a5, a3
    
    #Está armazenado em a5 = colunas e a6 = linhas
    mv t0, zero
    mul t0, a5, a6

    #Lendo a linha que pega o valor máximo do pixel da imagem
    mv a0, s0 # file descriptor = 0 (stdin)
    la a1, ler_dados #  buffer
    li a2, 4 # size (lendo apenas 1 byte, mas tamanho é variável)
    li a7, 63 # syscall read (63)
    ecall

    #Lendo a matriz
    mv a0, s0 # file descriptor = 0 (stdin)
    la a1, input_adress #  buffer
    mv a2, t0 # size (lendo apenas 1 byte, mas tamanho é variável)
    li a7, 63 # syscall read (63)
    ecall


#a3 = inicio da matriz; a5 = colunas; a6 = linhas. quantidade total
    mv a3, a1

#Fazendo setCanvasSize
    mv a0, a6
    mv a1, a5
    li a7, 2201
    ecall

li t0, 0
loop_linhas:
    li t1, 0
    bge t0, a6, end_loop_linhas

    loop_colunas:
        bge t1, a5, end_loop_colunas # t1 vai ser a coluna que está sendo executada
        mv t3, zero                  # t3 vai ser a linha que está sendo executada (posição no vetor enorme)

        mul t4, t0, a5
        add t3, t1, t4

        add s1, a3, t3              # colocando em s1 o endereço de a3 + t3 para poder dar load no byte.

        beq t1, zero, casos_borda
        beq t0, zero, casos_borda
        
        addi s4, a5, -1
        beq t1, s4, casos_borda

        addi s4, a6, -1
        beq t0, s4, casos_borda
        
        casos_geral:
            li s3, -1
            li s2, 0

            sub s4, s1, a5
            addi s4, s4, -1

            lbu s5, 0(s4)
            mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
            add s2, s2, s6

            addi s4, s4, 1

            lbu s5, 0(s4)
            mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
            add s2, s2, s6

            addi s4, s4, 1

            lbu s5, 0(s4)
            mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
            add s2, s2, s6

            mv s4, s1
            addi s4, s4, -1

            lbu s5, 0(s4)
            mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
            add s2, s2, s6

            addi s4, s4, 2 #pulando o pixel de valor 8 que será feito no final

            lbu s5, 0(s4)
            mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
            add s2, s2, s6

            add s4, s1, a5
            addi s4, s4, -1

            lbu s5, 0(s4)
            mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
            add s2, s2, s6

            addi s4, s4, 1

            lbu s5, 0(s4)
            mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
            add s2, s2, s6

            addi s4, s4, 1

            lbu s5, 0(s4)
            mul s6, s5, s3 # conta de multiplicação do w[k][q] pelo Win[i+k-1][j+q-1]
            add s2, s2, s6

            li s3, 8

            lbu s5, 0(s1)
            mul s6, s5, s3 #conta de multiplicação com a posição do meio valendo 8.
            add s2, s2, s6
            
            j verificar_cor
            

        casos_borda:
            mv s2, zero
            j escrever_canvas


        verificar_cor:
            li s3, 256
            bge s2, s3, mudar_branco
            blt s2, zero, mudar_preto 

            j escrever_canvas

        mudar_branco:
            li s2, 255
            j escrever_canvas

        mudar_preto:
            li s2, 0
            j escrever_canvas

        escrever_canvas:
            mv a2, zero
            add a2, a2, s2
            slli a2, a2, 8
            add a2, a2, s2
            slli a2, a2, 8
            add a2, a2, s2
            slli a2, a2, 8
            addi a2, a2, 255

            mv a0, t1
            mv a1, t0
            li a7, 2200
            ecall
            
            addi t1, t1, 1

            j loop_colunas


end_loop_colunas:
    addi t0, t0, 1
    j loop_linhas


end_loop_linhas: