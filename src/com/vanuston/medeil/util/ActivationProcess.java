/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.util;

/**
 *
 * @author saran
 */
public class ActivationProcess {

    static Logger log = Logger.getLogger(ActivationProcess.class, "com.vanuston.medeil.util");
    public static String Version = "";

    public String getActivationStatus() {

        String returnMessage = "";
        try {
            GetProductInfo getProductInfo = new GetProductInfo();
            LogReg logReg = new LogReg();
            WinRegistry winRegistry = new WinRegistry();
            boolean Activated = getProductInfo.CheckActivate();
            boolean Configurated = getProductInfo.configurated();
            int LicenseCount = getProductInfo.getLicenceCount();
            int Validity = getProductInfo.getValidity();
            int RDays = logReg.getRemainingDays();
            int RDays1 = getProductInfo.getRemainingDays();
            String InstalledDate = getProductInfo.getInstallDate();
            String ExpiryDate = winRegistry.getExpiryDate();
            String ExpiryDate1 = getProductInfo.getExpiryDate();
            Version = getProductInfo.getStatus();

            if (RDays != RDays1 && Activated==true) {

                returnMessage="crash";
            }

            String msg = "Class:Main Activation Status :[Activate='" + Activated + "', Configurated='" + Configurated + "', LicenseCount='" + LicenseCount + "', Validity Days='" + Validity + "', Remaining Days='" + RDays + "'='" + RDays1 + "', Installed Date='" + InstalledDate + "', Expiry Date='" + ExpiryDate + "'='" + ExpiryDate1 + "']";
            log.debug(msg);
            log.debug("RDays=  '" + RDays + "'  RDays1 = '" + RDays1 + "' ");
            log.debug("Expiry Date =  '" + ExpiryDate + "'  Expiry Date1 = '" + ExpiryDate1 + "' ");

            if (Activated==true && Configurated==true) {
                if ((Validity * 15 / 100) >= RDays || Validity <= 7) {
                    returnMessage = "expiry";
                }
            } else {
                if (Activated == false || Configurated == false) {
                    returnMessage = "configuration";
                    log.debug("Class:Main  Method : init() Unable to Launch MEDEIL ! Activated='" + Activated + "' ,Configurated='" + Configurated + "'");

                } else {
                    if (RDays <= 0) {
                        returnMessage = "expiry";
                    }
                }

            }

        } catch (Exception e) {
            log.debug("Class : ActivationProcess  Method : getActivationStatus  Error :  = " + e.getMessage());
           returnMessage = "configuration";
        }

        return returnMessage;
    }
}
