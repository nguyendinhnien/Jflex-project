/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package vc;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

/**
 *
 * @author niennguyen
 */
public class compare {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        String dir1 = "test.out";
        String dir2 = "HanoiTower.out";
        
        BufferedReader br1 = new BufferedReader(new FileReader(new  File(dir1)));
        BufferedReader br2 = new BufferedReader(new FileReader(new  File(dir2)));
        String line1, line2;
        int totalCorrect = 0;
        int total = 0;
        while ((line1 = br1.readLine()) != null && (line2 = br2.readLine()) != null){
            if( line1.equals(line2) ) { totalCorrect ++;} else {
                System.out.println(line1 + "\n" + line2);
            }
            total ++;
        }
           
        System.out.println("Correctness: " + (float)totalCorrect/total );
        
        br1.close();
        br2.close();
        
    }
}
