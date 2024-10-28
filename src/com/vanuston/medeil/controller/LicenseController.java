/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;



import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import com.vanuston.medeil.util.Logger;



/**
 *
 * @author vanuston
 */
public class LicenseController {
    static Logger log = Logger.getLogger(LicenseController.class, "LicenseDetails");
 
    public Boolean createServerDetails (String ipAddress, Integer portNo) {
        Boolean isCreate = false ;
        try {
            File server = new File ("server") ;
            String file = "server/serverdetails.txt" ;
            File serverDetails = new File ("server/serverdetails.txt") ;
            if (! server.exists())
                server.mkdirs();
            FileWriter fileWritter = new FileWriter (file, isCreate) ;
            fileWritter.write (ipAddress+","+portNo+"") ;
            fileWritter.flush () ;
            fileWritter.close () ;
            FileReader reader = new FileReader (file) ;
            int count = 0 ;
            while (reader.read() != -1)
                count += 1 ;            
            if (count != 0) 
                isCreate =  true ;            
            reader.close();
        } catch (IOException ex) {
            log.debug ("Class : LicenseController  Method  : createServerDetails() Exception:" + ex.getMessage ()) ;
        }
        return isCreate ;
    }
    public String getServerDetails () {
        String server = "";
        try {
            File serverFile = new File("server/serverdetails.txt") ;

            BufferedReader br = new BufferedReader(new FileReader(serverFile));
            String s;
            while ((s = br.readLine()) != null) {
                server = s ;            
            }

        } catch (Exception e) {
           log.debug("Method:getServerDetails Exception:"+e.getMessage());
        }
        return server ;
    }

}
