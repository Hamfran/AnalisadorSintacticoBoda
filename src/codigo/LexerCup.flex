package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L="\""[a-zA-Z]+([ ]+[a-zA-Z]+)*"\""
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
    return new Symbol(type, yyline, yycolumn, value);
}
private Symbol symbol(int type){
    return new Symbol(type, yyline, yycolumn);
}    

%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}



/* Inicio*/
( "BODA_INI" ) {return new Symbol(sym.Inicio, yychar,yyline,yytext());}

/* Fin */
( "BODA_FIN" ) {return new Symbol(sym.Fin, yychar,yyline,yytext());}

/* Hombre */
( "H" ) {return new Symbol(sym.Hombre, yychar,yyline,yytext());}



/* Mujer */
( "M" ) {return new Symbol(sym.Mujer, yychar,yyline,yytext());}



/* Nombre Invitado */
{L} {return new Symbol(sym.Nombre, yychar,yyline,yytext());}

/* Numero */
{D} {return new Symbol(sym.Mesa, yychar,yyline,yytext());}

/* Error de analisis */
 . {return new Symbol(sym.Error, yychar,yyline,yytext());}
