.globl _start
.globl int_handler
.globl logica_controle

.bss
.align 4
isr_stack: # Final da pilha das ISRs
.skip 1024 # Aloca 1024 bytes para a pilha
isr_stack_end: # Base da pilha das ISRs

.data
.set base_carro, 0xFFFF0100

.text
.align 4

Syscall_set_engine_and_steering:
    #mudar para a lógica, aqui só seta os parâmetros.
    sb t0, 0x20(a0)
    sb t1, 0x21(a0)

    ret

int_handler:
    ###### Tratador de interrupções e syscalls ######
    csrrw sp, mscratch, sp
    addi sp, sp, -64

    sw a0, 0(sp) # Salva a0
    sw a1, 4(sp) # Salva a1
    sw a2, 8(sp)
    sw a3, 12(sp)
    
    # <= Implemente o tratamento da sua syscall aqui 
    li t1, 10

    beq a7, t1, Syscall_set_engine_and_steering
    
    csrr t0, mepc  # carrega endereço de retorno (endereço 
                    # da instrução que invocou a syscall)
    addi t0, t0, 4 # soma 4 no endereço de retorno (para retornar após a ecall) 
    csrw mepc, t0  # armazena endereço de retorno de volta no mepc
    
    # Recupera o contexto   
    lw a3, 12(sp)
    lw a2, 8(sp) 
    lw a1, 4(sp) # Recupera a1
    lw a0, 0(sp) # Recupera a0

    addi sp, sp, 64 # Desaloca espaço da pilha da ISR
    csrrw sp, mscratch, sp # Troca sp com mscratch novamente

    mret           # Recuperar o restante do contexto (pc <- mepc)    

logica_controle:
    # implemente aqui sua lógica de controle, utilizando apenas as 
    # syscalls definidas.

    # Syscall_set_engine_and_steering: Código 10
    # Syscall_set_handbreak: Código 11
    # Syscall_read_sensors: Código 12
    # Syscall_get_position: Código 15

    li a0, 1
    li a1, -60
    li a7, 10
    ecall

    li t2, 0
    li t3, 8000
    
    loop_andar:
        bge t2, t3, end_loop_andar
        addi t2, t2, 1
        j loop_andar

    li a1, 1
    li a7, 11
    ecall


_start:

    la t0, int_handler  # Carregar o endereço da rotina que tratará as interrupções
    csrw mtvec, t0      # (e syscalls) em no registrador MTVEC para configurar
                        # o vetor de interrupções.

    # Configura mscratch com o topo da pilha das ISRs.
    la t0, isr_stack_end # t0 <= base da pilha
    csrw mscratch, t0 # mscratch <= t0

    # Escreva aqui o código para mudar para modo de usuário e chamar a função 
    # user_main (definida em outro arquivo). Lembre-se de inicializar a 
    # pilha do usuário para que seu programa possa utilizá-la.

    csrr t1, mie # Seta o bit 11 (MEIE)
    li t2, 0x800 # do registrador mie
    or t1, t1, t2
    csrw mie, t1

    # Habilita Interrupções Global
    csrr t1, mstatus # Seta o bit 3 (MIE)
    ori t1, t1, 0x8 # do registrador mstatus
    csrw mstatus, t1

