package jflexassignment;
import java.io.*;

%% 

%{
    static String capitalize(String s) {
        return Character.toUpperCase(s.charAt(0)) + s.substring(1);
    }
%}

%public 
%class Sentence
%type void

%init{
    yybegin(FIRST);
%init}

letter      =   [A-Za-z]
word        =   {letter}+
endPunct    =   [\.\!\?]
otherPunct  =   [\,\;\:]
space       =   [\ \t\r\n]

%state FIRST, REST

%%

<FIRST> {
        {word}  {
                    System.out.print( capitalize(yytext()) );
                    yybegin(REST);
                }          
        }

<REST>  {
        {word}  {
                    System.out.print( " "+ yytext());
                }
        {endPunct} {
                    System.out.println(yytext());
                }
        }

{space} {
            
        }

.       {
            System.err.println("Invalid character \"" + yytext() + "\"" );
        }