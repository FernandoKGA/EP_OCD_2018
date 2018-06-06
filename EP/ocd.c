#include <ctype.h>
#include <stdio.h>
#include <string.h>

void verificando(int c){
    printf("TESTANDO COM %c:  ", c);
    if(isalnum(c)){
        printf("Alphanumeric. ");
    }
    if(isalpha(c)){
        printf("Alphabetic. ");
    }
    if(isdigit(c)){
        printf("Decimal Digit. ");
    }
    if(iscntrl(c)){
        printf("Control Character. ");
    }
    if(isgraph(c)){
        printf("Graphic Representation. ");
    }
    if(islower(c)){
        printf("Lower Case. ");
    }
    if(isupper(c)){
        printf("Upper case.");
    }
    if(isprint(c)){
        printf("It's printable. ");
    }
    if(isxdigit(c)){
        printf("Hexadecimal. ");
    }
    printf("\n");
}

void converte(char ch, int *tipo, char *valor){
    /*
        O tipo 'char' eh na verdade uma representacao de um
        inteiro, transformado para caracter, exemplos: 
        57 -> '9'
        48 -> '0'
        97 -> 'a'
    */
    int caracter = (int) ch;

    //if(ch) inteiro retorna tipo 0
    if(caracter >= 48 && caracter <= 57){ //Inteiro
        *tipo = 0;
        *valor = (char) caracter;
    }
    else{
        //if(ch) letra(M ou m) retorna tipo 1
        /*
            No caso de ser letra, converte para maiuscula,
            se nao devolve inalterado.
        */
        if((caracter >= 65 && caracter <= 90) || ( //Letra
            caracter >= 97 && caracter <= 122)){
            
            *tipo = 1;
            if(caracter >= 97 && caracter <= 122){ //Se for minuscula
                /*
                    32 eh o valor correspondente na Tabela ASCII
                    para transformar de minuscula para maiuscula
                */
                caracter = caracter - 32;
            }
            *valor = (char)caracter;
        }
        else{   //Outra coisa.
            //else retorna tipo 2
            *tipo = 2;
            *valor = ch;
        }
            
    } 
}

void imprimeSequencia(char array[]){
    /*
        Le uma sequencia de n caracteres e imprime
        a sequencia convertida para maiscula, eliminando
        caracteres que nao forem letras ou numeros.
    */
    printf("Imprime sequencia.\n");
    int n = strlen(array);  //uso de string requer <string.h> 
    //Caso seja um array de caracteres separados, pode se usar sizeof().
    int tipo;
    char valor;
    for(int i=0 ;i < n; i++){  
        converte(array[i],&tipo,&valor);  //Converte
        if(tipo == 1){  //Se for letra, imprime (ja convertido)
            printf("%c",valor);
        }
    }
}

int main(){
    //Usaremos a ferramenta <ctype.h> para conseguirmos fazer a verifica��o dos tipos
    /*int x = '1';
    char a = 'a';
    char b = 'B';
    char z = 'z';
    verificando(x);
    verificando(a);
    verificando(b);
    verificando(z);*/

    int tipo;
    char valor;
    char car = '3';
    printf("Chamando converte.\n");
    converte(car,&tipo,&valor);
    printf("Conversao de: %c.\nTipo: %i.\nValor: %c\n",car,tipo,valor);
    char array[] = "C0onV3ER2 sa0o";
    printf(array);
    printf("\n");
    imprimeSequencia(array);
}


