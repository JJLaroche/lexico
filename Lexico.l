%{
#include <stdio.h>
#include <stdlib.h>


FILE  *yyin;
int yylval;
char *yyltext;


int yyerror(void);

%}

%option noyywrap  
%option yylineno 

DIGITO			    [0-9]
LETRA			    [a-zA-Z]

INCLUDE             "include"

DECVAR              "DECVAR"
ENDDEC              "ENDDEC"
WRITE               "write"
CTE		            {DIGITO}+
ID			        {LETRA}({LETRA}|{DIGITO})*
OP_AS   		    ":""="
OP_AS_MIO   	    ":"
OP_SUM		        "+"
OP_MUL              "*"
OP_RES		        "-"
OP_DIV              "/"
PA			        "("
PC			        ")"
INTEGER             "Integer"
FLOAT               "Float"
IF                  "if"
WHILE               "while"
PUNTO_COMA          ";"
COMA                ","
TEXTO               [\"].*[\"]
DISTINTO            "!="
IGUA_IGUAL          "=="
MENOR_IGUAL         "<="
MAYOR_IGUAL         ">="
MENOR               "<"
MAYOR               ">"
PARENTESIS_ABRE     "{"
PARENTESIS_CIERRA   "}"
CTE_REAL            [0]{0,1}[1-9]{0,11}[.][0-9]{1,11}

%%

{DECVAR}		    {printf("\nPalabra reservada DECVAR: %s\n", yytext);}
{ENDDEC}		    {printf("\nPalabra reservada ENDDEC: %s\n", yytext);}
{WRITE}		        {printf("\nPalabra reservada write: %s\n", yytext);}
{INTEGER}		    {printf("\nTipo Integer: %s\n", yytext);}
{FLOAT}		        {printf("\nTipo float: %s\n", yytext);}
{IF}                {printf("\nPalabra reservada IF: %s\n", yytext);}
{WHILE}             {printf("\nPalabra reservada WHILE: %s\n", yytext);}
{PUNTO_COMA}	    {printf("\nPunto y coma: %s\n", yytext);}
{COMA}	            {printf("\nComa: %s\n", yytext);}
{CTE}			    {printf("\nConstante: %s\n", yytext);}
{TEXTO}			    {printf("\nTexto: %s\n", yytext);}
{ID}			    {printf("\nIdentificador: %s\n", yytext);}
{MENOR_IGUAL}	    {printf("\nMenor igual: %s\n", yytext);}
{MAYOR_IGUAL}	    {printf("\nMayor igual: %s\n", yytext);}
{MENOR}			    {printf("\nMenor: %s\n", yytext);}
{MAYOR}			    {printf("\nMayor: %s\n", yytext);}
{PARENTESIS_ABRE}	{printf("\nParentesis abre: %s\n", yytext);}
{PARENTESIS_CIERRA}	{printf("\nParentesis cierra: %s\n", yytext);}
{CTE_REAL}	        {printf("\nConstante real: %s\n", yytext);}
{DISTINTO}	        {printf("\nDistinto: %s\n", yytext);}
{IGUA_IGUAL}	    {printf("\nIgualacion: %s\n", yytext);}

{OP_SUM}		{printf("\nSuma: %s\n", yytext);}
{OP_AS}			{printf("\nAsignacion: %s\n", yytext);}
{OP_AS_MIO}		{printf("\nAsignacion mio: %s\n", yytext);}
{OP_MUL}		{printf("\nMultiplicacion: %s\n", yytext);}
{OP_RES}		{printf("\nResta: %s\n", yytext);}
{OP_DIV}		{printf("\nDivision: %s\n", yytext);}
{PA}			{printf("\nParAbre: %s\n", yytext);}
{PC}			{printf("\nParCierra: %s\n", yytext);}
"\n"      		
"\t"
"\n\t"
" "             		
"\r\n"
.			 { printf( "ERROR LEXICO : Caracter no reconocido: %s\n", yytext ); exit (0);}

%%

int main(int argc, char *argv[])
{
    if((yyin = fopen(argv[1], "rt"))==NULL)
    {
        printf("\nNo se puede abrir el archivo de prueba: %s\n", argv[1]);
       
    }
    else
    { 
        
        yylex();
        
    }
	fclose(yyin);
        return 0;
}
int yyerror(void)
{
    printf("Error Sintactico\n");
    exit (1);
}
