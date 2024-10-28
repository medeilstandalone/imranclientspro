package com.vanuston.medeil.util;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

public class AdminAuth {

    public static String getAdminpwd() throws NoSuchAlgorithmException {
        String[] stringMonthYearArray = new String[4];
        Date date = new Date();
        String dateString = date.toString();
        String[] stringArray = dateString.split(" ");
        stringMonthYearArray[0] = "Medeil";
        stringMonthYearArray[1] = stringArray[1];
        stringMonthYearArray[2] = "Admin";
        stringMonthYearArray[3] = stringArray[5];
        String string = getEncryption(stringMonthYearArray);
        return string;
    }

    private static String getEncryption(String[] array) throws NoSuchAlgorithmException {
        String hexaFormatMessage = "";
        String concatString = array[0] + array[1] + array[2] + array[3];
        byte[] buffer = concatString.getBytes();
        java.security.MessageDigest messageDigest = java.security.MessageDigest.getInstance("SHA-256");
        messageDigest.update(buffer);
        byte[] messageDigestBytes = messageDigest.digest();
        for (int index = 0; index < messageDigestBytes.length; index++) {
            int countEncode = messageDigestBytes[index] & 0xff;
            if (Integer.toHexString(countEncode).trim().length() == 1) {
                hexaFormatMessage = hexaFormatMessage + "0";
            }
            hexaFormatMessage = hexaFormatMessage + Integer.toHexString(countEncode);
        }
        int length = hexaFormatMessage.trim().length() - 1;
        String pwString = "";
        int j = 1;
        for (int i = 1; i <= 8; i++) {
            pwString += hexaFormatMessage.charAt(length);
            if (j == 4 && i < 8) {
                pwString = pwString + "-";
                j = 0;
            }
            length = Math.abs(length - 8);
            j++;
        }
        return pwString;
    }
}
