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

int main(int argc, char** argv) {
    yylex();
    return 0;
}
