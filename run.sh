## Script para Unix
flex Lexico-tp.l
#bison -dyv Sintactico.y
gcc lex.yy.c -o compilador
./compilador tp.txt
rm lex.yy.c
#rm y.tab.c
#rm y.output
#rm y.tab.h
rm compilador