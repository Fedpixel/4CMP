%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
//Déclaration de la pile
char stack[100], top = -1;

//Déclaration de la taille de la pile
int stackSize = 0;

//Déclaration de la fonction push
void push(char val)
{
    stack[++top] = val;
}
%}

%option noyywrap

%%
^[ ]         { 
                push('+');
                stackSize++;
            }
^[ \t]       { 
                push('-');
                stackSize++;
            }
[ ]         { 
                push('0');
                stackSize++;
            }
[ \t]       { 
                push('1');
                stackSize++;
            }
\n          { 
                int decimal = 0;
                int rang = stackSize - 1;
                char sign;
                
                for(int i = 0; i < stackSize; i ++) {
                    if (stack[i] == '1') {
                        decimal += pow(2, rang);
                    }
                    else if (stack[i] == '+' || stack[i] == '-') {
                        sign = stack[i];

                    }
                    rang --;
                }
                
                printf("Résultat: %c%d\n", sign, decimal);
            }
.           { ; }
%%

int main() {  
    yylex();
    return 0;
}