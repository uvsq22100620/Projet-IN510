%{
#include <stdio.h>
#include <stdlib.h>
%}



%token ID EPSILON MOT_VIDE OP_PLUS OP_POINT OP_ETOILE PAR_O PAR_F



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
