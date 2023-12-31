%{
#include <stdio.h>
#include <stdlib.h>
%}


%token ID
% token EPSILON
% token MOT_VIDE

%token ID
% token EPSILON
% token MOT_VIDE

% token OP_PLUS
% token OP_POINT
% token OP_ETOILE

% token PAR_O
% token PAR_F

% token PAR_O
% token PAR_F


%%

num_a int;
num_a = 0;

exp : A {
            num_a ++;
        }
    | A OP_PLUS exp {
                        num_a ++;
                        printf($<lecode>$, "A%d = union(A%d, A%d)\n", num_a, )
                    }

A   : B {
            num_a ++;
        }
    | B OP_POINT C  {
                        num_a ++;
                        printf($<lecode>$, "A%d = concatenation(A%d, A%d)\n", num_a, )
                    }

B   : C {
            num_a ++;
        }
    | C OP_ETOILE   {
                        num_a ++;
                    }

C   : ID {
            num_a ++;
            printf($<lecode>$, "A%d = automate(lettre)\n", num_a, )
        }
    | EPSILON   {
                    num_a ++;
                    printf($<lecode>$, "A%d = automate(E)\n", num_a, )
                }
    #| MOT_VIDE {
    #                num_a ++;
    #                printf($<lecode>$, "A%d = automate(O)\n", num_a, )
    #            }
    | PAR_O exp PAR_F   {
                            num_a ++;
                        }

%%

int main() {
    yyparse(); // Appeler l'analyseur syntaxique généré par Bison
    return 0;
}
