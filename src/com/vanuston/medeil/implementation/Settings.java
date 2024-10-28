/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.SettingsModel;
import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 *
 * @author saran
 */
public interface Settings extends BaseImplements,Remote {
SettingsModel displaySettingValues() throws RemoteException ;
Integer[] getEnableAutoRoundoff() throws RemoteException ;
Integer setEnableAutoRoundoff(Integer[] isAutornd) throws RemoteException ;
int setSalesDiscountType(int salesDiscType) throws RemoteException;
int getSalesDiscountType() throws RemoteException;
}
