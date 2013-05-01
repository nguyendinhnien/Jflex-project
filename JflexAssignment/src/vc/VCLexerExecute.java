/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package vc;

import java.io.*;
import java.util.ArrayList;
import java_cup.runtime.Symbol;

/**
 *
 * @author niennguyen
 */
public class VCLexerExecute {
    static ArrayList<String> tokens = new ArrayList<>();
        
    /**
     * @param args the command line arguments
     */
    public static String getName(int i) {
        return tokens.get(i);
    }
    
    public static ArrayList<Symbol> execute(File file) {
        initList();
        Symbol sym;
        ArrayList<Symbol> listSym = new ArrayList();
        try {
            VCLexer lexer = new VCLexer(new FileReader(file));          
           for (sym = lexer.next_token(); sym.sym != 0; sym = lexer.next_token()) {       
               listSym.add(sym);
            }
        }
        catch (Exception e) {
        }
        return listSym;
    }
    private static void initList() {
        tokens.add(0,"EOF");
        tokens.add(1,"error");
        tokens.add(2,"IDENTIFIER");
        tokens.add(3,"FLOATING_POINT_LITERAL");
        tokens.add(4,"INTEGER_LITERAL");
        tokens.add(5,"BOOLEAN");
        tokens.add(6,"BREAK");
        tokens.add(7,"CONTINUE");
        tokens.add(8,"ELSE");
        tokens.add(9,"FLOAT");
        tokens.add(10,"FOR");
        tokens.add(11,"INT");
        tokens.add(12,"IF");
        tokens.add(13,"RETURN");
        tokens.add(14,"VOID");
        tokens.add(15,"WHILE");
        tokens.add(16,"BOOLEAN_LITERAL");
        tokens.add(17,"LPAREN");
        tokens.add(18,"RPAREN");
        tokens.add(19,"LBRACE");
        tokens.add(20,"RBRACE");
        tokens.add(21,"LBRACK");
        tokens.add(22,"RBRACK");
        tokens.add(23,"SEMICOLON");
        tokens.add(24,"COMA");
        tokens.add(25,"EQ");
        tokens.add(26,"GT");
        tokens.add(27,"LT");
        tokens.add(28,"NOT");
        tokens.add(29,"NOTEQ");
        tokens.add(30,"EQEQ");
        tokens.add(31,"LTEQ");
        tokens.add(32,"GTEQ");
        tokens.add(33,"ANDAND");
        tokens.add(34,"OROR");
        tokens.add(35,"PLUS");
        tokens.add(36,"MINUS");
        tokens.add(37,"MULT");
        tokens.add(38,"DIV");
        tokens.add(39,"STRING_LITERAL");
    }
}
