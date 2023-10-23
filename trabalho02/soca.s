.globl _start
.globl int_handler

.bss
.align 4
isr_stack: # Final da pilha das ISRs
.skip 1024 # Aloca 1024 bytes para a pilha
isr_stack_end: # Base da pilha das ISRs

.data

.set base_gpt,    0xFFFF0100
.set base_carro,  0xFFFF0300
.set base_serial, 0xFFFF0500
.set base_canvas, 0xFFFF0700

.text
.align 4

Syscall_set_motor:
    
    li t0, base_carro

    li t2, -127
    blt a1, t2, tratar_erro_angulo
    li t2, 128
    bge a1, t2, tratar_erro_angulo
    j setar_motor_angulo

    tratar_erro_angulo:
        li a0, -1
        j fim_syscall

    setar_motor_angulo:
        sb a1, 0x20(t0)

    li t2, 1
    beq a0, t2, setar_motor_velocidade
    li t2, -1
    beq a0, t2, setar_motor_velocidade
    beq a0, zero, setar_motor_velocidade
    j tratar_erro_velocidade

    setar_motor_velocidade:
        sb a0, 0x21(t0)
        j finalizar_set_engine

    tratar_erro_velocidade:
        li a0, -1
        j fim_syscall

    finalizar_set_engine:

    mv a0, zero
    j fim_syscall

Syscall_set_handbreak:
    li t0, base_carro
    sb a0, 0x22(t0)

    j fim_syscall

Syscall_read_sensors:
    li t0, base_carro

    li t5, 1
    sb t5, 0x01(t0)

    loop_read_sensors:
        lb t5, 0x01(t0)
        bne t5, zero, loop_read_sensors

    li t4, 256
    li t3, 0
    addi t0, t0, 0x24
    mv t6, a0

    for:
        bge t3, t4, end_for
        lbu t2, 0(t0)

        sb t2, 0(t6)

        addi t6, t6, 1
        addi t0, t0, 1
        addi t3, t3, 1
        j for

    end_for:

    j fim_syscall

Syscall_read_sensor_distance:
    li t0, base_carro

    li t5, 1
    sb t5, 0x02(t0)

    loop_read_sensor_distance:
        lb t5, 0x02(t0)
        bne t5, zero, loop_read_sensor_distance

    lw a0, 0x1c(t0)

    j fim_syscall

Syscall_get_position:
    li t0, base_carro

    li t5, 1
    sb t5, 0x00(t0)

    loop_get_position:
        lb t5, 0x00(t0)
        bne t5, zero, loop_get_position

    lw t2, 0x10(t0)
    lw t3, 0x14(t0)
    lw t4, 0x18(t0)

    sw t2, 0(a0)
    sw t3, 0(a1)
    sw t4, 0(a2)

    j fim_syscall

Syscall_get_rotation:
    li t0, base_carro

    li t5, 1
    sb t5, 0x00(t0)

    loop_get_rotation:
        lb t5, 0x00(t0)
        bne t5, zero, loop_get_rotation

    lw t2, 0x04(t0)
    lw t3, 0x08(t0)
    lw t4, 0x0c(t0)

    sw t2, 0(a0)
    sw t3, 0(a1)
    sw t4, 0(a2)

    j fim_syscall

Syscall_read:
    #Lendo caracteres do tamanho da imagem
    li t0, base_serial

    li t3, 0
    mv t6, a1
    
    loop_read_1byte:
        bge t3, a2, end_loop_read_1byte

        li t5, 1
        sb t5, 0x02(t0)

        busywaiting_read:
            lb t5, 0x02(t0)
            bne t5, zero, busywaiting_read

        lb t5, 0x03(t0)
        beq t5, zero, end_loop_read_1byte
        sb t5, 0(t6)

        addi t6, t6, 1
        addi t3, t3, 1
        j loop_read_1byte

    end_loop_read_1byte:
    
    mv a0, t3
    j fim_syscall

Syscall_write:
    li t0, base_serial

    mv t6, a1
    li t3, 0
    
    loop_write_1byte:
        lb t5, 0(t6)
        sb t5, 0x01(t0)
        
        li t5, 1
        sb t5, 0x00(t0)

        bge t3, a2, end_loop_write_1byte
        busywaiting_write:
        lb t5, 0x00(t0)
        bne t5, zero, busywaiting_write

        addi t6, t6, 1
        addi t3, t3, 1
        j loop_write_1byte

    end_loop_write_1byte:

    j fim_syscall

Syscall_draw_line:
    #faz a função de display_image do canvas

Syscall_get_systime:
    li t0, base_gpt

    li t1, 1
    sb t1, 0x00(t0)

    busywaiting_systime:
        lb t1, 0x00(t0)
        bne t1, zero, busywaiting_systime

    lw a0, 0x04(t0)
    
    j fim_syscall


int_handler:
    ###### Tratador de interrupções e syscalls ######
    csrrw sp, mscratch, sp
    addi sp, sp, -64

    sw a0, 0(sp) # Salva a0
    sw a1, 4(sp) # Salva a1
    sw a2, 8(sp)
    sw a3, 12(sp)
    sw t0, 16(sp)
    sw t1, 20(sp)
    sw t2, 24(sp)
    sw t3, 28(sp)
    sw t4, 32(sp)
    sw t5, 36(sp)
    sw t6, 40(sp)

    # <= Implemente o tratamento da sua syscall aqui 
    li t6, 10
    beq a7, t6, Syscall_set_motor

    li t6, 11
    beq a7, t6, Syscall_set_handbreak

    li t6, 12
    beq a7, t6, Syscall_read_sensors

    li t6, 13
    beq a7, t6, Syscall_read_sensor_distance

    li t6, 15
    beq a7, t6, Syscall_get_position

    li t6, 16
    beq a7, t6, Syscall_get_rotation

    li t6, 17
    beq a7, t6, Syscall_read

    li t6, 18
    beq a7, t6, Syscall_write

    li t6, 19
    beq a7, t6, Syscall_draw_line

    li t6, 20
    beq a7, t6, Syscall_get_systime
    
    fim_syscall:
    
    csrr t0, mepc  # carrega endereço de retorno (endereço 
                    # da instrução que invocou a syscall)
    addi t0, t0, 4 # soma 4 no endereço de retorno (para retornar após a ecall) 
    csrw mepc, t0  # armazena endereço de retorno de volta no mepc
    
    # Recupera o contexto   
    lw t6, 40(sp)
    lw t5, 36(sp)
    lw t4, 32(sp)
    lw t3, 28(sp)
    lw t2, 24(sp)
    lw t1, 20(sp)
    lw t0, 16(sp)
    lw a3, 12(sp)
    lw a2, 8(sp) 
    lw a1, 4(sp) # Recupera a1

    addi sp, sp, 64 # Desaloca espaço da pilha da ISR
    csrrw sp, mscratch, sp # Troca sp com mscratch novamente

    mret           # Recuperar o restante do contexto (pc <- mepc)    


_start:
    la t0, int_handler  # Carregar o endereço da rotina que tratará as interrupções
    csrw mtvec, t0      # (e syscalls) em no registrador MTVEC para configurar
                        # o vetor de interrupções.

    li sp, 0x07FFFFFC

    # Configura mscratch com o topo da pilha das ISRs.
    la t0, isr_stack_end # t0 <= base da pilha
    csrw mscratch, t0 # mscratch <= t0

    # Escreva aqui o código para mudar para modo de usuário e chamar a função 
    # user_main (definida em outro arquivo). Lembre-se de inicializar a 
    # pilha do usuário para que seu programa possa utilizá-la.

    csrr t1, mstatus # Update the mstatus.MPP
    li t2, ~0x1800 # field (bits 11 and 12)
    and t1, t1, t2 # with value 00 (U-mode)
    csrw mstatus, t1
    la t0, main # Loads the user software
    csrw mepc, t0 # entry point into mepc

    csrr t1, mie # Seta o bit 11 (MEIE)
    li t2, 0x800 # do registrador mie
    or t1, t1, t2
    csrw mie, t1

    # Habilita Interrupções Global
    csrr t1, mstatus # Seta o bit 3 (MIE)
    ori t1, t1, 0x8 # do registrador mstatus
    csrw mstatus, t1

    mret # PC <= MEPC; mode <= MPP;
