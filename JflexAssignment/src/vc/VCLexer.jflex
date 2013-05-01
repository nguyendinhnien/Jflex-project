/*-***
 *
 * This file defines a stand-alone lexical analyzer for a subset of the VC
 * programming language.  
 *
 */
package vc;

import java_cup.runtime.*;

%%

/*-*
 * LEXICAL FUNCTIONS:
 */

%cup
%line
%column
%unicode
%class VCLexer

%{

/**
 * Return a new Symbol with the given token id, and with the current line and
 * column numbers.
 */
Symbol newSym(int tokenId) {
    return new Symbol(tokenId, yyline+1, yycolumn+1);
}

/**
 * Return a new Symbol with the given token id, the current line and column
 * numbers, and the given token value.  The value is used for tokens such as
 * identifiers and numbers.
 */

Symbol newSym(int tokenId, Object value) {
    return new Symbol(tokenId, yyline+1, yycolumn+1, value);
}

%}


/*-*
 * PATTERN DEFINITIONS:
 */

letter              =   [A-Za-z_]
digit               =   [0-9]
identifier          =   {letter}({letter}|{digit})*
int_literal         =   {digit}{digit}*
fraction            =   \.{digit}*
exponent            =   (E|e)(\+|\-)?{digit}*
bool_literal        =   (true|false)
float_literal       =   ((({digit}* {fraction} {exponent}?))
                        |({digit}+\.)
                        |({digit}+\.? {exponent}))

string_content      =   (\\\"|[^\n\r\"]|\\{white_space}+\\)*
string_literal      =   {double_qoute}{string_content}{double_qoute}
double_qoute        =   \"

comment             = {trad_comment} | {line_comment} | {doc_comment}
trad_comment        = "/*" [^*] ~"*/" | "/*" "*"+ "/"
line_comment        = "//" ([^\r\n])* {newline}?
doc_comment         = "/*" "*"+ [^/*] ~"*/"

newline             =   \r|\n|\r\n
white_space         =   [\n\r\ \t]
%%

/**
 * LEXICAL RULES:
 */
    boolean             { return newSym(sym.BOOLEAN, yytext()); }
    float               { return newSym(sym.FLOAT, yytext()); }
    int                 { return newSym(sym.INT, yytext()); }
    void                { return newSym(sym.VOID, yytext()); }
    while               { return newSym(sym.WHILE, yytext()); }
    break               { return newSym(sym.BREAK, yytext()); }
    continue            { return newSym(sym.CONTINUE, yytext()); }
    if                  { return newSym(sym.IF, yytext()); }
    else                { return newSym(sym.ELSE, yytext()); }
    for                 { return newSym(sym.FOR, yytext()); }
    return              { return newSym(sym.RETURN, yytext()); }

    "="                 { return newSym(sym.EQ, yytext()); }
    "*"                 { return newSym(sym.MULT, yytext()); }
    "+"                 { return newSym(sym.PLUS, yytext()); }
    "-"                 { return newSym(sym.MINUS, yytext()); }
    "/"                 { return newSym(sym.DIV, yytext()); }
    "<"                 { return newSym(sym.LT, yytext()); }
    "<="                { return newSym(sym.LTEQ, yytext()); }
    ">"                 { return newSym(sym.GT, yytext()); }
    ">="                { return newSym(sym.GTEQ, yytext()); }
    "=="                { return newSym(sym.EQEQ, yytext()); }
    "!="                { return newSym(sym.NOTEQ, yytext()); }
    "&&"                { return newSym(sym.ANDAND, yytext()); }
    "||"                { return newSym(sym.OROR, yytext()); }
    "!"                 { return newSym(sym.NOT, yytext()); }
    "{"                 { return newSym(sym.LBRACE, yytext()); }
    "}"                 { return newSym(sym.RBRACE, yytext()); }
    "("                 { return newSym(sym.LPAREN, yytext()); }
    ")"                 { return newSym(sym.RPAREN, yytext()); }
    "["                 { return newSym(sym.LBRACK, yytext()); }
    "]"                 { return newSym(sym.RBRACK, yytext()); }
    ";"                 { return newSym(sym.SEMICOLON, yytext()); }
    ","                 { return newSym(sym.COMA, yytext()); }

    {int_literal}       { return newSym(sym.INTEGER_LITERAL, new Integer(yytext())); }
    {float_literal}     { return newSym(sym.FLOATING_POINT_LITERAL, new Double(yytext())); }
    {string_literal}    { return newSym(sym.STRING_LITERAL, yytext().substring(1, yylength()-1)); }
    {bool_literal}      { return newSym(sym.BOOLEAN_LITERAL, new Boolean(yytext())); }
    {identifier}        { return newSym(sym.IDENTIFIER, yytext()); }


    {comment}           { System.out.println("Comment recognize :\n" + yytext().substring(2, yylength()-2)); }
    {white_space}        { /* Ignore whitespace. */ }
    <<EOF>>             { return newSym(sym.EOF,"");}
    .                   { System.out.println("Illegal char, '" + yytext() +
                    "' line: " + yyline + ", column: " + yychar); }
