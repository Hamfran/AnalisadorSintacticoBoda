package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L="\""[a-zA-Z]+([ ]+[a-zA-Z]+)*"\""
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

 
/* Inicio*/
( "BODA_INI" ) {lexeme = yytext(); return Inicio;}
 

/* Fin */
( "BODA_FIN" ) {lexeme=yytext(); return Fin;}

/* Hombre */
( "H" ) {lexeme=yytext(); return Hombre;}

/* Mujer */
( "M" ) {lexeme=yytext(); return Mujer;}

/* Nombre Invitado */
{L} {lexeme=yytext(); return Nombre;}

/* Numero */
{D} {lexeme=yytext(); return Mesa;}

/* Error de analisis */
 . {lexeme=yytext(); return Error;}
