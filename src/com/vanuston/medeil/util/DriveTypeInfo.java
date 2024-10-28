/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.util;
/**
 *
 * @author VANEmp025
 */
import java.io.*;
import javax.swing.filechooser.*;

public class DriveTypeInfo
{
    public static void main(String[] args)
    {

        FileSystemView fsv = FileSystemView.getFileSystemView();
        File[] roots = fsv.getRoots();
        for (int i = 0; i < roots.length; i++)
        {

        }




        File[] f = File.listRoots();
        for (int i = 0; i < f.length; i++)
        {

        }

    }
    public static String getAutoBackupPath(){

        File[] f = File.listRoots();
        String sysDrive = System.getenv("SystemDrive")+"\\";
        String getPath=sysDrive;
        for (int i = 0; i < f.length; i++)
        {
            if(!sysDrive.equalsIgnoreCase(f[i].getAbsolutePath()))
            {
                getPath = f[i].getAbsolutePath();
		break;
            }
        }
        return getPath;
    }
    public static String getDataDirPath(){
        String dataDrive = System.getenv("MedeilData");
        return dataDrive;
    }
}
