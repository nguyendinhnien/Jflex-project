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
public class JflexToJava {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String dirFile = "C:\\Users\\nguyen\\Documents\\NetBeansProjects\\JflexAssignment\\src\\jflexassignment\\sentence.jflex";
        File jflexFile = new File(dirFile);
        JFlex.Main.generate(jflexFile);
    }
}
