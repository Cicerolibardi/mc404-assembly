#include <fcntl.h>
#include <unistd.h>

#define MAX_FILE_SIZE 100 * 1024
#define MAX_NAME_SIZE 100
#define MAX_SECTIONS_QTD 100

enum Tipo_secao {outros = 0, shstrtab = 1, strtab = 2, symtab = 3, text = 4};

typedef struct Secoes
{
    int idx_secao;
    unsigned char nome_secao[MAX_NAME_SIZE];
    int tamanho_secao;
    int endereco_virtual_secao;
    int offset_arquivo;
    int offset_nome;
    enum Tipo_secao tipo_secao;
} Secoes;

typedef struct Symtab_strct
{
    int endereco_virtual_rotulo;
    int offset_simbolo;
    int tipo_simbolo; //será local ou global
    unsigned char simbolo; //local ou global

    unsigned char nome_secao[MAX_NAME_SIZE];
    int tamanho_secao;
    unsigned char nome_rotulo[MAX_NAME_SIZE];

    int num_secao; //numero da secao representado pelo arquivo elf;
} Symtab_strct;

int inteiro_para_decimal(unsigned long int inteiro, char decimal[]){
    char numero_provisorio[50];

    int i = 0;

    while (inteiro > 0){
        numero_provisorio[i] = (inteiro % 10);
        i++;
        inteiro = inteiro / 10;
    }

    int k = 0;

    for (int j = i - 1; j >= 0; j--){
        decimal[k] = numero_provisorio[j] + '0';
        k++;
    }

    if (k == 0){
        decimal[0] = '0';
        k++;
    }

    decimal[k] = '\0';
    return k+1;
}

int inteiro_para_hexadecimal(unsigned long int inteiro, char hexadecimal[]){
    char numero_provisorio[50];

    int i = 0;

    while (inteiro > 0){
        numero_provisorio[i] = (inteiro % 16);
        i++;
        inteiro = inteiro / 16;
    }

    int k = 0;
    for (int j = 7; j >= 0; j--){
        if (j > i - 1){
            hexadecimal[k] = '0';
        }
        else{
            if (numero_provisorio[j] > 9){
                hexadecimal[k] = numero_provisorio[j] + 'a' - 10;
            }
            else{
                hexadecimal[k] = numero_provisorio[j] + '0';
            }
        }
        k++;
    }

    hexadecimal[k] = '\0';
    return k+1;
}

int inteiro_para_hexadecimal_sem_zeros(unsigned long int inteiro, char hexadecimal[]){
    char numero_provisorio[50];

    int i = 0;

    while (inteiro > 0){
        numero_provisorio[i] = (inteiro % 16);
        i++;
        inteiro = inteiro / 16;
    }

    int k = 0;
    for (int j = i - 1; j >= 0; j--){
        if (numero_provisorio[j] > 9){
            hexadecimal[k] = numero_provisorio[j] + 'a' - 10;
    }
        else{
            hexadecimal[k] = numero_provisorio[j] + '0';
    }
        k++;
    }

    hexadecimal[k] = '\0';
    return k+1;
}

void stringcpy(unsigned char *dest, unsigned char *src){
    int i;
    for (i = 0; src[i] != '\0'; i++)
        dest[i] = src[i];
    dest[i] = '\0';
}

int stringcmp(unsigned char *dest, unsigned char *src){
    for (int i = 0; src[i] != '\0'; i++){
        if (dest[i] != src[i])
            return 0;
    }
    return 1;
}

int stringlen(unsigned char *src){
    int i = 0;
    while (src[i] != '\0')
        i++;
    return i+1;
}

int elevar_numero(int base, int potencia){
    int elevado = 1;
    for (int i = 0; i < potencia; i++)
        elevado *= base;
    return elevado;
}

int transformar_bigendian_inteiro(unsigned char *num_vetor, int tamanho){
    int rv = 0;
    for (int i = 0; i < tamanho; i++)
        rv += num_vetor[i] * elevar_numero(16, 2*i);
    return rv;
}

int achar_endereco(unsigned char *arquivo, int offset, int tamanho){
    unsigned char destino[5];
    for (int i = 0; i < tamanho; i++)
        destino[i] = arquivo[offset + i];
    destino[tamanho] = '\0';

    return transformar_bigendian_inteiro(destino, tamanho);
}

void definir_secoes_elf(unsigned char *arquivo, Secoes *secoes_elf, int e_shoff ,int e_shstrndx, int e_shnum){
    for (int i = 0; i < e_shnum; i++){
        secoes_elf[i].idx_secao = i;
        secoes_elf[i].offset_arquivo = achar_endereco(arquivo,e_shoff + (i*40) + 0x10, 4);
        secoes_elf[i].tamanho_secao = achar_endereco(arquivo, e_shoff + (i*40) + 0x14, 4);
        secoes_elf[i].endereco_virtual_secao = achar_endereco(arquivo, e_shoff + (i*40) + 0x0C, 4);
        secoes_elf[i].offset_nome = achar_endereco(arquivo, e_shoff + (i*40), 4);
    }
}

void definir_nome_secoes(unsigned char *arquivo, Secoes *secoes_elf, int offset_headers, int e_shnum){
    int tam_str = 0;
    for (int i = 0; i < e_shnum; i++){
        tam_str = stringlen(arquivo + offset_headers + secoes_elf[i].offset_nome);
        int j = 0;
        for (j = 0; j < tam_str; j++)
            secoes_elf[i].nome_secao[j] = arquivo[offset_headers + secoes_elf[i].offset_nome + j];
        secoes_elf[i].nome_secao[j] = '\0';

        if (stringcmp(secoes_elf[i].nome_secao, (unsigned char *) ".shstrtab\0")) secoes_elf[i].tipo_secao = shstrtab;
        else if (stringcmp(secoes_elf[i].nome_secao, (unsigned char *) ".strtab\0")) secoes_elf[i].tipo_secao = strtab;
        else if (stringcmp(secoes_elf[i].nome_secao, (unsigned char *) ".symtab\0")) secoes_elf[i].tipo_secao = symtab;
        else if (stringcmp(secoes_elf[i].nome_secao, (unsigned char *) ".text\0")) secoes_elf[i].tipo_secao = text;
        else secoes_elf[i].tipo_secao = outros;
        
    }
}

void print_secoes(Secoes *secoes_elf, unsigned char *nome_arquivo, int e_shnum){
    unsigned char string_padrao[] = ": file format elf32-littleriscv\n\nSections:\nIdx Name Size VMA\n";
    write(1, "\n", 1);
    write(1, nome_arquivo, stringlen(nome_arquivo) - 1);
    write(1, string_padrao, stringlen(string_padrao) - 1);

    char decimal[50];
    char hex[50];
    int tam_idx;
    int tam_hex;

    for (int i = 0; i < e_shnum; i++){
        tam_idx = inteiro_para_decimal(secoes_elf[i].idx_secao, decimal);
        write(1, decimal, tam_idx - 1);
        write(1, " ", 1);
        write(1, secoes_elf[i].nome_secao, stringlen(secoes_elf[i].nome_secao) - 1);
        write(1, " ", 1);   
        tam_hex = inteiro_para_hexadecimal(secoes_elf[i].tamanho_secao, hex);
        write(1, hex, tam_hex - 1);
        write(1, " ", 1);
        tam_hex = inteiro_para_hexadecimal(secoes_elf[i].endereco_virtual_secao, hex);
        write(1, hex, tam_hex - 1);
        write(1, "\n", 1);
    }
    write(1, "\n", 1);
} 

void definir_parametros_symtab(unsigned char *arquivo, Secoes *secoes_elf, Symtab_strct *symtab_elementos, int strtabndx, int symtabndx){
    int endereco_inicial_symtab = secoes_elf[symtabndx].offset_arquivo + 0x10;
    int endereco_inicial_strtab = secoes_elf[strtabndx].offset_arquivo;       
    int tam_str;

    for (int i = 0; i < (secoes_elf[symtabndx].tamanho_secao) / 0x10 - 1; i++){
        symtab_elementos[i].offset_simbolo = achar_endereco(arquivo, endereco_inicial_symtab + (0x10 * i), 4);
        symtab_elementos[i].tipo_simbolo = achar_endereco(arquivo, endereco_inicial_symtab + (0x10 * i) + 0xc, 1);
        symtab_elementos[i].tamanho_secao = achar_endereco(arquivo, endereco_inicial_symtab + (0x10 * i) + 0x8, 4);
        symtab_elementos[i].num_secao = achar_endereco(arquivo, endereco_inicial_symtab + (0x10 * i) + 0xe, 2);
        symtab_elementos[i].endereco_virtual_rotulo = achar_endereco(arquivo, endereco_inicial_symtab + (0x10 * i) + 0x4, 4);
        
        tam_str = stringlen(arquivo + endereco_inicial_strtab + symtab_elementos[i].offset_simbolo);
        int j = 0;
        for (j = 0; j < tam_str; j++)
            symtab_elementos[i].nome_rotulo[j] = arquivo[endereco_inicial_strtab + symtab_elementos[i].offset_simbolo + j];
        symtab_elementos[i].nome_rotulo[j] = '\0';

        if (symtab_elementos[i].num_secao < (secoes_elf[symtabndx].tamanho_secao / 0x10)){
            tam_str = stringlen(secoes_elf[symtab_elementos[i].num_secao].nome_secao);
            for (j = 0; j < tam_str; j++)
                symtab_elementos[i].nome_secao[j] = secoes_elf[symtab_elementos[i].num_secao].nome_secao[j];
            symtab_elementos[i].nome_secao[j] = '\0';
        }
        else {
            char abs[] = "*ABS*\0";
            for (j = 0; abs[j] != '\0'; j++){
                symtab_elementos[i].nome_secao[j] = abs[j];
            }
            symtab_elementos[i].nome_secao[j] = '\0';
        }

        if (symtab_elementos[i].tipo_simbolo >> 4 == 0x0)symtab_elementos[i].simbolo = 'l';
        else symtab_elementos[i].simbolo = 'g';
    }
}

void print_symbol_table(Symtab_strct *symtab_elementos, unsigned char *nome_arquivo, int qtd_rotulos){
    unsigned char string_padrao[] = ": file format elf32-littleriscv\n\0";
    unsigned char string_symbol_table[] = "SYMBOL TABLE:\n\0";

    char hex[50];
    int tam_hex;

    write(1, "\n", 1);
    write(1, nome_arquivo, stringlen(nome_arquivo) - 1);
    write(1, string_padrao, stringlen(string_padrao) - 1);
    write(1, "\n", 1);
    write(1, string_symbol_table, stringlen(string_symbol_table) - 1);

    for (int i = 0; i < qtd_rotulos - 1; i++){
        tam_hex = inteiro_para_hexadecimal(symtab_elementos[i].endereco_virtual_rotulo, hex);
        write(1, hex, tam_hex - 1);
        write(1, " ", 1);
        if (symtab_elementos[i].tipo_simbolo >> 4 == 0x0)
            write(1, "l", 1);
        else
            write(1, "g", 1);
        
        write(1, " ", 1);
        write(1, symtab_elementos[i].nome_secao, stringlen(symtab_elementos[i].nome_secao) - 1);
        write(1, " ", 1);
        tam_hex = inteiro_para_hexadecimal(symtab_elementos[i].tamanho_secao, hex);
        write(1, hex, tam_hex - 1);
        write(1, " ", 1);
        write(1, symtab_elementos[i].nome_rotulo, stringlen(symtab_elementos[i].nome_rotulo) - 1);
        write(1, "\n", 1);
    }
}

void print_dissably_text(unsigned char *arquivo, Secoes *secoes_elf, Symtab_strct *symtab_elementos, int textndx, int symtabndx, unsigned char *nome_arquivo){
    int tamanho_text = secoes_elf[textndx].tamanho_secao;
    int endereco_instrucao = 0;
    unsigned char string_padrao[] = ": file format elf32-littleriscv\n\n\0";
    unsigned char string_disassembly[] = "Disassembly of section .text:\n\0";

    char hex[50];
    int tam_hex;

    write(1, "\n", 1);
    write(1, nome_arquivo, stringlen(nome_arquivo) - 1);
    write(1, string_padrao, stringlen(string_padrao) - 1);
    write(1, "\n", 1);
    write(1, string_disassembly, stringlen(string_disassembly) - 1);

    for (int i = 0; i < tamanho_text; i+=4){
        endereco_instrucao = secoes_elf[textndx].endereco_virtual_secao + i;
        for (int j = 0; j < ((secoes_elf[symtabndx].tamanho_secao) / 0x10) - 1; j++){
            if (endereco_instrucao == symtab_elementos[j].endereco_virtual_rotulo){
                tam_hex = inteiro_para_hexadecimal(endereco_instrucao, hex);
                write(1, "\n", 1);
                write(1, hex, tam_hex - 1);
                write(1, " <", 2);
                write(1, symtab_elementos[j].nome_rotulo, stringlen(symtab_elementos[j].nome_rotulo) - 1);
                write(1, ">:\n", 3);
            }
        }

        tam_hex = inteiro_para_hexadecimal_sem_zeros(endereco_instrucao, hex);
        write(1, hex, tam_hex - 1);
        write(1, ": ", 2);

        for (int j = 0; j < 4; j++){
            int num_instruc = achar_endereco(arquivo, secoes_elf[textndx].offset_arquivo + i + j, 1);
            tam_hex = inteiro_para_hexadecimal_sem_zeros(num_instruc, hex);
            if ((num_instruc< 0x10) && (num_instruc != 0))
                write(1, "0", 1);
            else if (num_instruc == 0)
                write(1, "00", 2);

            write(1, hex, tam_hex - 1);
            write(1, " ", 1);
        }
        write(1, "\n", 1);
    }
}

int main(int argc, char *argv[]){
    //argv[1] será o tipo de operação e argv[2] será o arquivo a ser executado.
    unsigned char arquivo[MAX_FILE_SIZE];
    int strtabndx = 0;
    int symtabndx = 0;
    int textndx = 0;

    int rv = open(argv[argc - 1], O_RDONLY);    
    read(rv, &arquivo, MAX_FILE_SIZE);

    int e_shoff = achar_endereco(arquivo, 0x20, 4);
    int e_shnum = achar_endereco(arquivo, 0x30, 2);
    int e_shstrndx = achar_endereco(arquivo, 0x32, 2);
    
    Secoes secoes_elf[MAX_SECTIONS_QTD];

    definir_secoes_elf(arquivo, secoes_elf, e_shoff, e_shstrndx, e_shnum);
    definir_nome_secoes(arquivo, secoes_elf, secoes_elf[e_shstrndx].offset_arquivo, e_shnum);

    for (int i = 0; i < e_shnum; i++){
        if (secoes_elf[i].tipo_secao == strtab)strtabndx = i;
        else if (secoes_elf[i].tipo_secao == symtab)symtabndx = i;
        else if (secoes_elf[i].tipo_secao == text)textndx = i;
    }

    Symtab_strct symtab_elementos[MAX_SECTIONS_QTD];

    definir_parametros_symtab(arquivo, secoes_elf, symtab_elementos, strtabndx, symtabndx);

    if (stringcmp((unsigned char *) argv[1], (unsigned char *) "-h")){
        print_secoes(secoes_elf, (unsigned char *) argv[2], e_shnum);
    }
    else if (stringcmp((unsigned char *) argv[1], (unsigned char *) "-t")){
        print_symbol_table(symtab_elementos, (unsigned char *) argv[2], secoes_elf[symtabndx].tamanho_secao / 0x10);
    }
    else if (stringcmp((unsigned char *) argv[1], (unsigned char *) "-d")){
        print_dissably_text(arquivo, secoes_elf, symtab_elementos, textndx, symtabndx, (unsigned char *) argv[2]);
    }
    close(rv);
    return 0;
}