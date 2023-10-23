.globl _start
.globl play_note
.globl _system_time
.globl main_ist
.globl exit

.data
.set base_gpt, 0xFFFF0100
.set base_sintetizador, 0xFFFF0300

.section .bss

_system_time: .skip 4

.align 4
isr_stack: # Final da pilha das ISRs
.skip 1024 # Aloca 1024 bytes para a pilha
isr_stack_end: # Base da pilha das ISRs

.text
.align 2

exit:
    mv a7, a0
    ecall
    ret

play_note:
    li t0, base_sintetizador
    sb a0, 0(t0)
    sh a1, 2(t0)
    sb a2, 4(t0)
    sb a3, 5(t0)
    sh a4, 6(t0)
    ret

main_isr:
    # Salvar o contexto
    csrrw sp, mscratch, sp # Troca sp com mscratch
    addi sp, sp, -64 # Aloca espaço na pilha da ISR
    sw a0, 0(sp) # Salva a0
    sw a1, 4(sp) # Salva a1
    sw a2, 8(sp)
    sw a3, 12(sp)

    #TRATAR A INTERRUPÇÃO
    li a0, 100
    li a1, base_gpt
    sw a0, 8(a1)

    la a2, _system_time
    lw a3, 0(a2)
    addi a3, a3, 100
    sw a3, 0(a2)

    # Recupera o contexto   
    lw a3, 12(sp)
    lw a2, 8(sp) 
    lw a1, 4(sp) # Recupera a1
    lw a0, 0(sp) # Recupera a0

    addi sp, sp, 64 # Desaloca espaço da pilha da ISR
    csrrw sp, mscratch, sp # Troca sp com mscratch novamente
    mret # Retorna da interrupção

_start:
    la t0, main_isr # Carrega o endereço da main_isr
    csrw mtvec, t0 # em mtvec
    
    # Configura mscratch com o topo da pilha das ISRs.
    la t0, isr_stack_end # t0 <= base da pilha
    csrw mscratch, t0 # mscratch <= t0

    li a0, 100
    li a1, base_gpt
    sw a0, 8(a1)
    
    csrr t1, mie # Seta o bit 11 (MEIE)
    li t2, 0x800 # do registrador mie
    or t1, t1, t2
    csrw mie, t1

    # Habilita Interrupções Global
    csrr t1, mstatus # Seta o bit 3 (MIE)
    ori t1, t1, 0x8 # do registrador mstatus
    csrw mstatus, t1

    call main

    call exit