package com.vanuston.medeil.util;

import com.vanuston.medeil.client.RegistryFactory;

import com.vanuston.medeil.implementation.CommonImplements;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class GetUserInfo {

    public static String pwd;
    public static String empName;
    public static String empCode;
    public static String userType;
    public static String home;
    public static String sales;
    public static String inv;
    public static String mas;
    public static String fin;
    public static String crm;
    public static String report;
    static Logger log = Logger.getLogger(GetUserInfo.class, "Utilities");

    public String getSessionID() {
        String sname = "";
        Random r = new Random();
        String[] charc = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N",
         "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
        String a1 = charc[Math.abs(r.nextInt() % 26)];
        String b1 = charc[Math.abs(r.nextInt() % 26)];
        String c1 = charc[Math.abs(r.nextInt() % 26)];
        String d1 = charc[Math.abs(r.nextInt() % 26)];
        String a = Math.abs(r.nextInt() % 10) + "" + Math.abs(r.nextInt() % 10) + "" + Math.abs(r.nextInt() % 10);
        String b = Math.abs(r.nextInt() % 10) + "" + Math.abs(r.nextInt() % 10) + "" + Math.abs(r.nextInt() % 10);
        sname = a1 + a + "" + b1 + "" + c1 + b + "" + d1;
        return sname;
    }
    public static boolean checkName(String uname) throws Exception {
        boolean boo = true;
        String query = "select user_name from user_info where user_name='" + uname + "' and ui_flag_id=0";
        String sar = "";
        try {
            CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            sar = commonController.getQueryValue(query);
            if (!sar.equals("")) {
                boo = false;
            }
        } catch (Exception ex) {
            String ss = "Method : checkName     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }        
        return boo;
    }

    public static String shopName() {

        String shopName = "";
        try {
            String sql = "select shop_name from shop_information";
            CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            shopName = commonController.getQueryValue(sql);

        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return shopName;
    }

    public static List<String> getUserName(String name) {

        List<String> userArray = new ArrayList<String>();
        String query = null;
        try {
            
            CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            userArray = commonController.getUserName(name);

        } catch (Exception ex) {
            String ss = "Method : getUserName     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return userArray;
    }


    public static String getUsers(String uname) {
        String query = "select user_name from user_info where user_name='" + uname + "'";

        String pass = "";
        try {
            CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            pass = commonController.getQueryValue(query);

        } catch (Exception ex) {
            String ss = "Method : getUsers     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return pass;
    }

    public static String getPassword(String uname) {
        String query = "select password from user_info where user_name='" + uname + "'";
        String pass = "";
        try {
            CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            pass = commonController.getQueryValue(query);


        } catch (Exception ex) {
            String ss = "Method : getPassword     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return pass;
    }

    public static String getUserType(String uname) {
        String utype = "";
        if (uname.equals("MedeilAdmin")) {
            utype = "Admin";
        } else {
            String query = "select user_type from user_info where user_name='" + uname + "'";
            try {
                CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
                utype = commonController.getQueryValue(query);

            } catch (Exception ex) {
                String ss = "Method : getUserType     Exception :" + ex.getMessage() + " Query :" + query;
                log.debug(ss);
            }
        }
        return utype;
    }

    public String getPrivileges(String modname, String uname) {
        String query = "select " + modname + " from user_info where user_name='" + uname + "'";
        String priv = "";
        try {
            CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            priv = commonController.getQueryValue(query);
        } catch (Exception ex) {
            String ss = "Method : getPrivileges     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }

        return priv;
    }

    public static String getTIN() {
        String tin = "";
        String query = "select tin_no from shop_information";
        try {
            CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            tin = commonController.getQueryValue(query);

        } catch (Exception ex) {
            String ss = "Method : getAdminPass     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return tin;
    }

    public boolean getSalesBoolean(int n) {
        boolean bo = false;
        try {
            String[] sal = VersionLookup.getSales().split(",");

            if (sal[n].equals("0")) {
                bo = true;
            }
        } catch (Exception ex) {
            String ss = "Method : getSalesBoolean     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return bo;
    }

    public boolean getInventoryBoolean(int n) {
        String[] invnt = VersionLookup.getInventory().split(",");
        boolean bo = false;
        if (invnt[n].equals("0")) {
            bo = true;
        }
        return bo;
    }

    public boolean getMastersBoolean(int n) {
        String[] mastr = VersionLookup.getMasters().split(",");
        boolean bo = false;
        if (mastr[n].equals("0")) {
            bo = true;
        }
        return bo;
    }

    public boolean getFinancialBoolean(int n) {
        String[] finan = VersionLookup.getFinancial().split(",");
        boolean bo = false;
        if (finan[n].equals("0")) {
            bo = true;
        }
        return bo;
    }

    public boolean getCRMBoolean(int n) {
        String[] crm1 = VersionLookup.getCRM().split(",");
        boolean bo = false;
        if (crm1[n].equals("0")) {
            bo = true;
        }
        return bo;
    }

    public boolean getReportsBoolean(int n) {
        String[] rep = VersionLookup.getReports().split(",");
        boolean bo = false;
        if (rep[n].equals("0")) {
            bo = true;
        }
        return bo;
    }

    public static int getSalesInt(int n) {
        String[] sal = VersionLookup.getSales().split(",");
        int bo = 0;
        bo = Integer.parseInt(sal[n]);
        return bo;
    }

    public int getInventoryInt(int n) {
        String[] invnt = VersionLookup.getInventory().split(",");
        int bo = 0;
        bo = Integer.parseInt(invnt[n]);
        return bo;
    }

    public static int getMastersInt(int n) {
        String[] mastr = VersionLookup.getMasters().split(",");
        int bo = 0;
        bo = Integer.parseInt(mastr[n]);
        return bo;
    }

    public int getFinancialInt(int n) {
        String[] finan = VersionLookup.getFinancial().split(",");
        int bo = 0;
        bo = Integer.parseInt(finan[n]);
        return bo;
    }

    public int getCRMInt(int n) {
        String[] crm1 = VersionLookup.getCRM().split(",");
        int bo = 0;
        bo = Integer.parseInt(crm1[n]);
        return bo;
    }

    public int getReportInt(int n) {
        String[] rep = VersionLookup.getReports().split(",");
        int bo = 0;
        bo = Integer.parseInt(rep[n]);
        return bo;
    }

    String updateVal(String s, String m, String user) {
        String salPriv1 = "";
        String salQue = "";
        try {
            salQue = "select " + m + " from user_info where user_name='" + user + "'";
            String[] salPriv = getQueryValue(salQue).split(",");
            String[] salVerLook = s.split(",");
            int sal = 0;
            for (String j : salPriv) {
                if (sal > 0) {
                    salPriv1 += ",";
                }
//                if (!status.equals("Standard")) {
                if (salVerLook[sal].equals("0")) {
                    j = salVerLook[sal];
                }
//                }

                salPriv1 += j;
                sal++;
            }
        } catch (Exception ex) {
            String ss = "Method : updateVal(String , int, String)       Exception :" + ex.getMessage() + "         Query :" + salQue;
            log.debug(ss);
        }
        return salPriv1;
    }

    String updateVal(String m, String user) {
        String salPriv1 = "";
        String salQue = "";
        try {
            salQue = "select " + m + " from user_info where user_name='" + user + "'";

            String[] salPriv = getQueryValue(salQue).split(",");
            //(salQue).split(",");
            int sal = 0;
            for (String j : salPriv) {
                if (sal > 0) {
                    salPriv1 += ",";
                }
                salPriv1 += "3";
                sal++;
            }
        } catch (Exception ex) {
            String ss = "Method : updateVal(String , int, String)       Exception :" + ex.getMessage() + "         Query :" + salQue;
            log.debug(ss);
        }
        return salPriv1;
    }

    public Boolean getPriv(String modname, String uname) {
        Boolean priv = false;
        try {
            if (checkName(uname) == false) {

                String access = getPrivileges(modname, uname);
                String[] modulePerm = access.split(",");
                for (int i = 0; i < modulePerm.length; i++) {
                    if (Integer.parseInt(modulePerm[i]) != 0) {
                        priv = true;
                    }
                }
            }
        } catch (Exception ex) {
            log.debug("Class :GetUserInfo Method : getPriv    Exception :" + ex.getMessage());
        }        
        return priv;
    }

    public Integer getMenuPriv(String module, String submodule) {

        Integer result = 0;
        try {
            GetProductInfo getProductInfo = new GetProductInfo();
            String version = getProductInfo.getStatus();
            String query = "SELECT " + version + " FROM version_formlookup where object='Settings' and module='" + module + "'and submodule='" + submodule + "'";
            CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            result = Integer.parseInt(commonController.getQueryValue(query));

        } catch (Exception ex) {
            String ss = "Class:GetUserInfo  Method :public static Integer getPriv(String module,String submodule) Exception :" + ex.getMessage();
            log.debug(ss);
        }

        return result;
    }

 public static String getServerDetails () {
        String server = "192.168.100.201";
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
    public String getQueryValue(String que) {
        String value = "";
        try {
            CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            value = commonController.getQueryValue(que);

        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getQueryValue():StringException:" + ex.getMessage();
            log.debug(ss);
        }
        return value;
    }
}
