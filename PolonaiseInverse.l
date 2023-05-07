%{
#include <stdio.h>
//Déclaration de la pile
int stack[100], top = -1;

//Déclaration de la fonction push
void push(int val)
{
    stack[++top] = val;
}

//Déclaration de la fonction pop
int pop()
{
    return stack[top--];
}
%}

%option noyywrap

%%
[0-9]+      { 
                push(atoi(yytext));
            }
[-+*/]      {
                int val2 = pop();
                int val1 = pop();
                push(*yytext == '+' ? val1 + val2 : *yytext == '-' ? val1 - val2 : *yytext == '*' ? val1 * val2 : val1 / val2);
            }
[ \t\n]     ;
.           { 
                printf("Saisie invalide: %c\n", *yytext); 
            }
%%

int main()
{
    yylex();
    printf("Résultat: %d\n", stack[0]);
    return 0;
}