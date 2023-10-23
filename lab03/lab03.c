int read(int __fd, const void *__buf, int __n){
    int bytes;
    __asm__ __volatile__(
    "mv a0, %1           # file descriptor\n"
    "mv a1, %2           # buffer \n"
    "mv a2, %3           # size \n"
    "li a7, 63           # syscall read (63) \n"
    "ecall \n"
    "mv %0, a0"
    : "=r"(bytes)  // Output list
    :"r"(__fd), "r"(__buf), "r"(__n)    // Input list
    : "a0", "a1", "a2", "a7"
    );
    return bytes;
}
 
void write(int __fd, const void *__buf, int __n){
    __asm__ __volatile__(
    "mv a0, %0           # file descriptor\n"
    "mv a1, %1           # buffer \n"
    "mv a2, %2           # size \n"
    "li a7, 64           # syscall write (64) \n"
    "ecall"
    :   // Output list
    :"r"(__fd), "r"(__buf), "r"(__n)    // Input list
    : "a0", "a1", "a2", "a7"
    );
}

// Retorna 0 se for decimal e 1 se for hexadecimal.
int reconhecer_entrada(char str[]){
    if (str[1] != 'x'){
        return 0;
    }
    return 1;
}

int elevar_numero(int base, int potencia){
    int elevado = 1;
    for (int i = 0; i < potencia; i++){
        elevado *= base;
    }
    return elevado;
}

unsigned long int transformar_str_int(char str[], int tipo_entrada, int n){
    int numero_retornar = 0; 
    
    if (tipo_entrada == 0){
        if (str[0] == '-'){
            for (int j = 1; j < n - 1; j++){
                numero_retornar += (str[j] - '0') * elevar_numero(10, n - j - 2);
            }
        }
        else{
            for (int j = 0; j < n - 1; j++){
                numero_retornar += (str[j] - '0') * elevar_numero(10, n - j - 2);
            }
        }
    }
    else if (tipo_entrada == 1){
        for (int j = 2; j < n - 1; j++){
            if (str[j] <= '9'){
                numero_retornar += (str[j] - '0') * elevar_numero(16, n - j - 2);
            }
            else{
                numero_retornar += (str[j] + 10 - 'a') * elevar_numero(16, n - j - 2);
            }        
        }
    }

    return numero_retornar;
}

int inteiro_para_binario(unsigned long int inteiro, char binario[]){
    char numero_provisorio[50];

    int i = 0;

    while (inteiro > 0){
        numero_provisorio[i] = (inteiro % 2);
        i++;
        inteiro = inteiro / 2;
    }

    binario[0] = '0';
    binario[1] = 'b';
    int k = 2;
    for (int j = i - 1; j >= 0; j--){
        binario[k] = numero_provisorio[j] + '0';
        k++;
    }

    binario[k] = '\n';
    binario[k+1] = '\0';
    return k+2;
}

int inteiro_para_hexadecimal(unsigned long int inteiro, char hexadecimal[]){
    char numero_provisorio[50];

    int i = 0;

    while (inteiro > 0){
        numero_provisorio[i] = (inteiro % 16);
        i++;
        inteiro = inteiro / 16;
    }

    hexadecimal[0] = '0';
    hexadecimal[1] = 'x';
    int k = 2;
    for (int j = i - 1; j >= 0; j--){
        if (numero_provisorio[j] > 9){
            hexadecimal[k] = numero_provisorio[j] + 'a' - 10;
    }
        else{
            hexadecimal[k] = numero_provisorio[j] + '0';
    }
        k++;
    }

    hexadecimal[k] = '\n';
    hexadecimal[k+1] = '\0';
    return k+2;
}

int inteiro_para_decimal(unsigned long int inteiro, char decimal[], char token){
    char numero_provisorio[50];

    int i = 0;
    int k;

    if (token == 1){
        decimal[0] = '-';
        k = 1;
    }
    else{
        k = 0;
    }

    while (inteiro > 0){
        numero_provisorio[i] = (inteiro % 10);
        i++;
        inteiro = inteiro / 10;
    }

    for (int j = i - 1; j >= 0; j--){
        decimal[k] = numero_provisorio[j] + '0';
        k++;
    }

    decimal[k] = '\n';
    decimal[k+1] = '\0';
    return k+2;
}

int trocar_endianess(unsigned int inteiro, char endianess_trocado[]){

    int mascara = 0x000000ff;

    char num_provisorio[50];

    unsigned int numero_final = 0;
    unsigned int mais_esquerda = 0;
    unsigned int meio_esquerda = 0;
    unsigned int meio_direita = 0;
    unsigned int mais_direita = 0;

    mais_direita = inteiro & mascara;
    mascara = mascara << 8;
    meio_direita = inteiro & mascara;
    mascara = mascara << 8;
    meio_esquerda = inteiro & mascara;
    mascara = mascara << 8;
    mais_esquerda = inteiro & mascara;

    mais_direita = mais_direita << 24;
    meio_direita = meio_direita << 8;
    meio_esquerda = meio_esquerda >> 8;
    mais_esquerda = mais_esquerda >> 24;

    numero_final = mais_direita + meio_direita + meio_esquerda + mais_esquerda;
    int n = inteiro_para_decimal(numero_final, num_provisorio, 0);

    int i = 0;
    while (num_provisorio[i] != '\n') {
        endianess_trocado[i] = num_provisorio[i];
        i++;
    }
    endianess_trocado[i] = '\n';
    endianess_trocado[i + 1] = '\0';
    return i+2;
}


int main()
{
    char str[20];
    unsigned long int numero_inteiro;
    
    char binario[50];
    char decimal[50];
    char hexadecimal[50];
    char endianess_trocado[50];

    int token = 0;

    int n = read(0, str, 20);

    int tipo_entrada = reconhecer_entrada(str);

    numero_inteiro = transformar_str_int(str, tipo_entrada, n);

    int numero_positivo = numero_inteiro;
    
    if (str[0] == '-'){
        numero_inteiro *= -1;
        token = 1;
    }
    
    if (str[1] == 'x' && str[2] > '7' && n > 10){
        numero_positivo *= -1;
        token = 1;
    }

    int tamanho_binario = inteiro_para_binario(numero_inteiro, binario);
    int tamanho_hexadecimal = inteiro_para_hexadecimal(numero_inteiro, hexadecimal);
    int tamanho_endianess = trocar_endianess(numero_inteiro, endianess_trocado);
    int tamanho_inteiro = inteiro_para_decimal(numero_positivo, decimal, token);

    write(1, binario, tamanho_binario);
    write(1, decimal, tamanho_inteiro);
    write(1, hexadecimal, tamanho_hexadecimal);
    write(1, endianess_trocado, tamanho_endianess);
    
    return 0;
}
 
void _start(){
  main();
}