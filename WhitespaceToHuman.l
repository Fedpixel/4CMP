%{
#include <stdio.h>
%}

%option noyywrap

%%
[ ]             { putchar('S'); }
[ \t]           { putchar('T'); }
\n              { putchar('L'); }
.               { ; }

%%

int main() {
    yylex();
    return 0;
}
