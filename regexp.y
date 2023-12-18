%{
#include <stdio.h>
#include <stdlib.h>
%}


%token ID
% token EPSILON
% token MOT_VIDE

% token OP_PLUS
% token OP_POINT
% token OP_ETOILE

% token PAR_O
% token PAR_F


%%
exp : A
    | A OP_PLUS exp

A   : B
    | B OP_POINT C

B   : C
    | C OP_ETOILE

C   : ID
    | EPSILON
    | MOT_VIDE
    | PAR_O exp PAR_F

%%

int main() {
    yyparse(); // Appeler l'analyseur syntaxique généré par Bison
    return 0;
}
