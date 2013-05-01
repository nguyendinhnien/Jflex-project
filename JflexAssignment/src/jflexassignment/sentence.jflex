package jflexassignment;
import java.io.*;

%% 

%public 
%class flexer
%type void


letter      =   [A-Za-z]
word        =   {letter}+
endPunct    =   [\.\!\?]
otherPunct  =   [\,\;\:]
space       =   [\ \t\r\n]

%%

        int  {
                    System.out.println("Kieu int" );        
                }   
        {word}  {
                    System.out.println("identifier" );        
                }   

        " " {}

.       {
            System.err.println("Invalid character \"" + yytext() + "\"" );
        }