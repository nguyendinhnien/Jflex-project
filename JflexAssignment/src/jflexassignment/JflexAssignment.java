/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jflexassignment;

import java.io.*;
/**
 *
 * @author niennguyen
 */
public class JflexAssignment {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        String dirInputFile = "C:\\Users\\nguyen\\Documents\\NetBeansProjects\\JflexAssignment\\src\\jflexassignment\\inputFile.txt";
        InputStream inputStream = new FileInputStream(dirInputFile); 
        flexer lexer = new flexer(inputStream);
        lexer.yylex();
    }
}
