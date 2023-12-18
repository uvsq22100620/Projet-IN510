%{
#define ID 100
#define EPSILON 101
#define MOT_VIDE 102
#define OP_PLUS 103
#define OP_POINT 104
#define OP_ETOILE 105
#define PAR_O 106
#define PAR_F 107

int yyval;
%}

/* Les e.r. */
sep 		[ \t]
blanc 		{sep}+
lettre 		[a-z]
id 			{lettre}*

%%

{blanc}		{}
\n 			{}
{id} 		{return ID;}
E           {return EPSILON;}
O           {return MOT_VIDE;}
\+          {return OP_PLUS;}
\.          {return OP_POINT}
\*          {return OP_ETOILE}
\(          {return PAR_O}
\)          {return PAR_F}

%%

int main (int argc, char*argv[]) {
	printf("Debut de l'Analyse Lexicale\n");
	int retour;
	do {
		retour = yylex();
		if (retour==ID) printf("(ID, %d)\n");
		if (retour==EPSILON) printf("(Epsilon)\n");
		if (retour==MOT_VIDE) printf("(Mot vide)\n");
        if (retour==OP_PLUS) printf("(Operateur +)\n");
        if (retour==OP_POINT) printf("(.)\n");
        if (retour==OP_ETOILE) printf("(*)\n");
        if (retour==PAR_O) printf("(Parenthese ouvrante)\n");
        if (retour==PAR_F) printf("(Parenthese fermante)\n");
	} while (retour);
	printf("Fin de l'Analyse Lexicale\n");
return 0;
}