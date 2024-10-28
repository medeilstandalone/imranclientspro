package com.vanuston.medeil.ui;

import javafx.scene.layout.LayoutInfo;
import javafx.scene.control.Keystroke;
import javafx.scene.Scene;
import javafx.scene.input.KeyCode;
import com.vanuston.medeil.util.GetUserInfo;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.AdminAuth;
public var content : Scene;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.controller.LicenseController;
import javafx.scene.control.TextBox;
import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import java.lang.Exception;
import java.lang.Runtime;
import java.net.InetAddress;
/*import java.net.InetAddress;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.Process;
import javax.swing.JOptionPane;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;*/
public class Login {


    def MessageBox = MessageBox{};
    var log: Logger = Logger.getLogger(Login.class, "Home");
     var serverHostIP: String = "" ;
    var serverPort : Integer = 20202;

    var ScreenWidth = bind CommonDeclare.ScreenWidth;
    var ScreenHeight = bind  CommonDeclare.ScreenHeight;

    public var fss : Boolean = false;
    public var uname: String = "" ;
    var listH : Float= 0.0;
    var listW : Float= 0.0;
    var ExitMedeil:Boolean=false;
    public var ses_id="";

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        styleClass: "DialogBox"
        strokeWidth: 4.0
        width: bind ScreenWidth
        height: bind ScreenHeight
    }
    
    public-read def rectBgControlbuttons: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 0.75
        layoutX: bind rectBgControlbuttonsLX
        layoutY: bind rectBgControlbuttonsLY
        fill: javafx.scene.paint.Color.WHITE
        width: 100.0
        height: 35.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 365.0
        height: 1.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 80.0
        layoutY: 50.0
        layoutInfo: __layoutInfo_separator
    }
    
    def __layoutInfo_listUser: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listUser: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        opacity: 0.5
        layoutX: 413.0
        layoutY: 6.0
        layoutInfo: __layoutInfo_listUser
        items: null
    }
    
    public-read def loginProgress: javafx.scene.control.ProgressIndicator = javafx.scene.control.ProgressIndicator {
        visible: false
        layoutX: 380.0
        layoutY: 129.0
    }
    
    public-read def lblRemainingDays: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
    }
    
    public-read def lblRemainWarning: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 180.0
        layoutY: 22.0
        graphic: lblRemainingDays
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 41.0
        layoutY: 78.0
        text: "Label"
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 49.0
        layoutY: 98.0
        text: "Label"
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 38.0
        layoutY: 147.0
        text: "Label"
    }
    
    def __layoutInfo_pwdReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def pwdReset: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        visible: false
        layoutX: 154.0
        layoutY: 98.0
        layoutInfo: __layoutInfo_pwdReset
    }
    
    def __layoutInfo_pwdResetConfirm: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def pwdResetConfirm: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        visible: false
        layoutX: 181.0
        layoutY: 147.0
        layoutInfo: __layoutInfo_pwdResetConfirm
    }
    
    def __layoutInfo_txtfgtUser: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtfgtUser: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 137.0
        layoutY: 51.0
        layoutInfo: __layoutInfo_txtfgtUser
    }
    
    def __layoutInfo_listFUser: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listFUser: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 43.0
        layoutY: 211.0
        layoutInfo: __layoutInfo_listFUser
        items: null
    }
    
    public-read def panelfgtpwd: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 61.0
        layoutY: 124.0
        content: [ label7, label8, label9, pwdReset, pwdResetConfirm, txtfgtUser, listFUser, ]
    }
    
    def __layoutInfo_pwdAdmin: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def pwdAdmin: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        visible: false
        layoutX: 179.0
        layoutY: 84.0
        layoutInfo: __layoutInfo_pwdAdmin
    }
    
    def __layoutInfo_separator2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def separator2: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: false
        layoutX: 28.0
        layoutY: 109.0
        layoutInfo: __layoutInfo_separator2
    }
    
    def __layoutInfo_btnBack: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnBack: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 86.0
        layoutY: 280.0
        layoutInfo: __layoutInfo_btnBack
        text: "Button"
    }
    
    def __layoutInfo_btnReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnReset: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 187.0
        layoutY: 274.0
        layoutInfo: __layoutInfo_btnReset
        text: "Button"
        action: btnResetAction
    }
    
    def __layoutInfo_btnResetCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnResetCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 312.0
        layoutY: 274.0
        layoutInfo: __layoutInfo_btnResetCancel
        text: "Button"
        action: btnResetCancelAction
    }
    
    def __layoutInfo_btnGo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnGo: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutInfo: __layoutInfo_btnGo
        text: "Button"
    }
    
    public-read def panelMsgBox: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelMsgBoxLX
        layoutY: bind panelMsgBoxLY
        blocksMouse: true
    }
    
    public-read def rectangleClienBG: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: 100.0
        height: 50.0
    }
    
    public-read def labelServer: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtServerAddress: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtServerAddress: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtServerAddress
    }
    
    public-read def labelServerIP: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def labelSeverPort: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtServerPort: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtServerPort: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtServerPort
    }
    
    def __layoutInfo_buttonConnect: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def buttonConnect: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutInfo: __layoutInfo_buttonConnect
        text: "Button"
    }
    
    public-read def panelClient: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelLoginLX
        layoutY: bind panelLoginLY
        content: [ rectangleClienBG, labelServer, txtServerAddress, labelServerIP, labelSeverPort, txtServerPort, buttonConnect, ]
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelMsgBoxLX
        layoutY: bind panelMsgBoxLY
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#e4f0f4") }, ]
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtPassword: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 200.0
        height: 25.0
    }
    public-read def txtPassword: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        layoutX: 180.0
        layoutY: 100.0
        layoutInfo: __layoutInfo_txtPassword
        onKeyPressed: txtPasswordOnKeyPressed
        text: ""
        promptText: "* * * * * * * * * *"
        selectOnFocus: true
        font: Arial_12
    }
    
    public-read def chkrememberpwd: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        visible: false
        layoutX: 181.0
        layoutY: 131.0
        styleClass: "check-box"
        text: "Remember me"
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def Arial_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 14.0
    }
    
    def __layoutInfo_txtUser: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 200.0
        height: 25.0
    }
    public-read def txtUser: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: 180.0
        layoutY: 65.0
        layoutInfo: __layoutInfo_txtUser
        onKeyPressed: txtUserOnKeyPressed
        text: ""
        promptText: ""
        font: Arial_14
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 14.0
    }
    
    public-read def Arial_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 16.0
    }
    
    public-read def Arial_Bold_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 16.0
    }
    
    public-read def Arial_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 18.0
    }
    
    public-read def Arial_Bold_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 18.0
    }
    
    public-read def Arial_20: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 20.0
    }
    
    public-read def Arial_Bold_20: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 20.0
    }
    
    public-read def reflectionEffect: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    def __layoutInfo_btnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        height: 30.0
    }
    public-read def btnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: 300.0
        layoutY: 163.0
        layoutInfo: __layoutInfo_btnCancel
        styleClass: "button"
        onKeyPressed: btnCancelOnKeyPressed
        effect: reflectionEffect
        text: "Cancel"
        font: Arial_Bold_14
        action: btnCancelAction
    }
    
    def __layoutInfo_btnLogin: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        height: 30.0
    }
    public-read def btnLogin: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: 180.0
        layoutY: 163.0
        layoutInfo: __layoutInfo_btnLogin
        styleClass: "button"
        onKeyPressed: btnLoginOnKeyPressed
        effect: reflectionEffect
        text: "Login"
        font: Arial_Bold_14
        action: btnLoginAction
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 80.0
        layoutY: 13.0
        text: "Login"
        font: Arial_25
        textFill: javafx.scene.paint.Color.BLACK
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def rectForgotPasswordBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 13.0
        layoutY: 4.0
        styleClass: "LoginBox"
        fill: null
        stroke: DarkGray
        width: 500.0
        height: 350.0
    }
    
    public-read def panelForgotPassword: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelFgtPwdLX
        layoutY: bind panelFgtPwdLY
        blocksMouse: true
        content: [ rectForgotPasswordBg, label5, label6, panelfgtpwd, pwdAdmin, separator2, btnBack, btnReset, btnResetCancel, btnGo, ]
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 100.0
        layoutY: 100.0
        text: "Password"
        font: Arial_14
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 100.0
        layoutY: 65.0
        text: "Username"
        font: Arial_14
        textFill: DarkGray
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.6
    }
    
    public-read def lblEdition: javafx.scene.control.Label = javafx.scene.control.Label {
        opacity: 1.0
        layoutX: bind imgLogoLX+75.0
        layoutY: bind imgLogoLY+45.0
        text: ""
        font: Arial_Bold_14
        hpos: javafx.geometry.HPos.LEFT
        graphicHPos: javafx.geometry.HPos.CENTER
        textFill: Green
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Gray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.4
        blue: 0.4
    }
    
    public-read def lblforgotpwd: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 25.0
        layoutY: 174.0
        styleClass: "forgotpassword"
        onMouseClicked: lblforgotpwdOnMouseClicked
        onMouseEntered: lblfgtpwdOnMouseEntered
        onMouseExited: lblfgtpwdOnMouseExited
        text: "Forgot your password ?"
        font: Arial_12
        textFill: Gray
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def rectLoginBG: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 1.0
        layoutX: 0.0
        styleClass: "LoginBox"
        effect: dropShadowEffect
        fill: null
        stroke: DarkGray
        strokeWidth: 4.0
        width: 500.0
        height: 225.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    public-read def imageUserLogin: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/UserLogin.png"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 8.0
        layoutY: 0.0
        image: imageUserLogin
        fitWidth: 102.0
        fitHeight: 90.0
    }
    
    public-read def panelLogin: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelLoginLX
        layoutY: bind panelLoginLY
        onKeyPressed: panelLoginOnKeyPressedAtLogin
        blocksMouse: true
        content: [ rectLoginBG, label, label2, label3, txtUser, btnLogin, btnCancel, lblforgotpwd, chkrememberpwd, txtPassword, imageView, separator, listUser, loginProgress, lblRemainWarning, ]
    }
    
    public-read def login: Keystroke = Keystroke {
        code: javafx.scene.input.KeyCode.VK_F2
    }
    
    public-read def imageMedilLogin: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Medil Login.png"
    }
    
    def __layoutInfo_imageBackground: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 0.0
    }
    public-read def imageBackground: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_imageBackground
        onMouseClicked: imageBackgroundOnMouseClicked
        image: imageMedilLogin
        fitWidth: bind ScreenWidth
        fitHeight: bind ScreenHeight
        preserveRatio: false
    }
    
    public-read def imageLogin: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Login.png"
    }
    
    public-read def imageLogo: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Medil Logo.png"
    }
    
    public-read def imgLogo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind imgLogoLX
        layoutY: bind imgLogoLY
        image: imageLogo
    }
    
    def __layoutInfo_panel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutInfo: __layoutInfo_panel
        blocksMouse: true
        content: [ rectangle, imageBackground, rectBgControlbuttons, lblEdition, imgLogo, panelLogin, panelForgotPassword, panelMsgBox, panelClient, panelAlert, ]
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/WindowMaximize.png"
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/WindowMinimize.png"
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/WindowRestore.png"
    }
    
    public-read def image4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/WindowClose.png"
    }
    
    public-read def Arial_Bold_40: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 40.0
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Login", "ForgotPassword", "Client", ]
        actual: 2
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectBgControlbuttons.opacity = 0.9;
                            rectLoginBG.opacity = 0.5;
                            rectLoginBG.effect = null;
                            btnLogin.styleClass = "button";
                            btnCancel.styleClass = "button";
                            btnCancel.action = btnCancelActionAtLogin;
                            lblforgotpwd.text = "Forgot Password ?";
                            lblforgotpwd.font = Arial_12;
                            imageView.layoutX = 10.0;
                            imageView.layoutY = 5.0;
                            imageView.fitWidth = 64.0;
                            imageView.fitHeight = 64.0;
                            listUser.opacity = 0.75;
                            lblRemainingDays.visible = true;
                            lblRemainingDays.font = Arial_Bold_40;
                            lblRemainWarning.visible = true;
                            lblRemainWarning.layoutX = 240.0;
                            lblRemainWarning.layoutY = 10.0;
                            lblRemainWarning.font = Arial_Bold_20;
                            lblRemainWarning.graphicHPos = javafx.geometry.HPos.RIGHT;
                            lblRemainWarning.textFill = Gray;
                            panelLogin.visible = true;
                            panelLogin.onKeyPressed = panelLoginOnKeyPressedAtLogin;
                            rectForgotPasswordBg.visible = false;
                            rectForgotPasswordBg.opacity = 1.0;
                            rectForgotPasswordBg.layoutX = 13.0;
                            rectForgotPasswordBg.layoutY = 4.0;
                            rectForgotPasswordBg.effect = null;
                            rectForgotPasswordBg.strokeWidth = 1.0;
                            rectForgotPasswordBg.arcWidth = 0.0;
                            rectForgotPasswordBg.arcHeight = 0.0;
                            label5.visible = false;
                            label5.layoutX = 0.0;
                            label5.layoutY = 0.0;
                            label5.text = "Label";
                            label5.font = null;
                            label6.visible = false;
                            label6.layoutX = 41.0;
                            label6.layoutY = 78.0;
                            label6.text = "Label";
                            label7.visible = false;
                            label7.layoutX = 0.0;
                            label7.layoutY = 0.0;
                            label7.text = "Label";
                            label7.textFill = javafx.scene.paint.Color.BLACK;
                            label8.visible = false;
                            label8.layoutX = 49.0;
                            label8.layoutY = 98.0;
                            label8.text = "Label";
                            label8.textFill = javafx.scene.paint.Color.BLACK;
                            label9.visible = false;
                            label9.layoutX = 38.0;
                            label9.layoutY = 147.0;
                            label9.text = "Label";
                            label9.textFill = javafx.scene.paint.Color.BLACK;
                            pwdReset.visible = false;
                            pwdReset.layoutX = 154.0;
                            pwdReset.layoutY = 98.0;
                            pwdReset.promptText = null;
                            pwdResetConfirm.visible = false;
                            pwdResetConfirm.layoutX = 181.0;
                            pwdResetConfirm.layoutY = 147.0;
                            pwdResetConfirm.promptText = null;
                            txtfgtUser.visible = false;
                            txtfgtUser.layoutX = 137.0;
                            txtfgtUser.layoutY = 51.0;
                            listFUser.visible = false;
                            listFUser.opacity = 1.0;
                            listFUser.layoutX = 43.0;
                            listFUser.layoutY = 211.0;
                            panelfgtpwd.visible = false;
                            panelfgtpwd.layoutX = 61.0;
                            panelfgtpwd.layoutY = 124.0;
                            pwdAdmin.visible = false;
                            pwdAdmin.layoutX = 179.0;
                            pwdAdmin.promptText = null;
                            separator2.visible = false;
                            separator2.layoutX = 28.0;
                            separator2.layoutY = 109.0;
                            btnBack.visible = false;
                            btnBack.layoutX = 86.0;
                            btnBack.layoutY = 280.0;
                            btnBack.text = "Button";
                            btnReset.visible = false;
                            btnReset.layoutX = 187.0;
                            btnReset.layoutY = 274.0;
                            btnReset.text = "Button";
                            btnResetCancel.visible = false;
                            btnResetCancel.layoutX = 312.0;
                            btnResetCancel.layoutY = 274.0;
                            btnResetCancel.text = "Button";
                            btnGo.visible = false;
                            btnGo.layoutX = 0.0;
                            btnGo.layoutY = 0.0;
                            btnGo.text = "Button";
                            panelForgotPassword.visible = false;
                            rectangleClienBG.visible = false;
                            rectangleClienBG.fill = javafx.scene.paint.Color.BLACK;
                            rectangleClienBG.stroke = null;
                            rectangleClienBG.strokeWidth = 1.0;
                            rectangleClienBG.width = 100.0;
                            rectangleClienBG.height = 50.0;
                            rectangleClienBG.arcWidth = 0.0;
                            rectangleClienBG.arcHeight = 0.0;
                            labelServer.visible = false;
                            labelServer.layoutX = 0.0;
                            labelServer.layoutY = 0.0;
                            labelServer.text = "Label";
                            labelServer.textFill = javafx.scene.paint.Color.BLACK;
                            txtServerAddress.visible = false;
                            txtServerAddress.layoutX = 0.0;
                            txtServerAddress.layoutY = 0.0;
                            labelServerIP.visible = false;
                            labelServerIP.layoutX = 0.0;
                            labelServerIP.layoutY = 0.0;
                            labelServerIP.text = "Label";
                            labelServerIP.textFill = javafx.scene.paint.Color.BLACK;
                            labelSeverPort.visible = false;
                            labelSeverPort.opacity = 1.0;
                            labelSeverPort.layoutX = 0.0;
                            labelSeverPort.layoutY = 0.0;
                            labelSeverPort.text = "Label";
                            labelSeverPort.textFill = javafx.scene.paint.Color.BLACK;
                            txtServerPort.visible = false;
                            txtServerPort.layoutX = 0.0;
                            txtServerPort.layoutY = 0.0;
                            txtServerPort.text = null;
                            buttonConnect.visible = false;
                            buttonConnect.layoutX = 0.0;
                            buttonConnect.layoutY = 0.0;
                            buttonConnect.text = "Button";
                            panelClient.visible = false;
                            panelAlert.visible = false;
                            panelAlert.blocksMouse = false;
                            __layoutInfo_panel.width = 1024.0;
                            __layoutInfo_panel.height = 768.0;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectBgControlbuttons.opacity = 0.75;
                            rectLoginBG.opacity = 1.0;
                            rectLoginBG.effect = dropShadowEffect;
                            btnLogin.styleClass = "button";
                            btnCancel.styleClass = "button";
                            btnCancel.action = btnCancelAction;
                            lblforgotpwd.text = "Forgot your password ?";
                            lblforgotpwd.font = Arial_12;
                            imageView.layoutX = 8.0;
                            imageView.layoutY = 0.0;
                            imageView.fitWidth = 102.0;
                            imageView.fitHeight = 90.0;
                            listUser.opacity = 0.5;
                            lblRemainingDays.visible = false;
                            lblRemainWarning.visible = false;
                            lblRemainWarning.layoutX = 180.0;
                            lblRemainWarning.layoutY = 22.0;
                            lblRemainWarning.graphicHPos = javafx.geometry.HPos.LEFT;
                            lblRemainWarning.textFill = javafx.scene.paint.Color.BLACK;
                            panelLogin.visible = false;
                            panelLogin.onKeyPressed = panelLoginOnKeyPressedAtLogin;
                            rectForgotPasswordBg.visible = true;
                            rectForgotPasswordBg.opacity = 0.5;
                            rectForgotPasswordBg.layoutX = 0.0;
                            rectForgotPasswordBg.layoutY = 0.0;
                            rectForgotPasswordBg.effect = null;
                            rectForgotPasswordBg.strokeWidth = 4.0;
                            rectForgotPasswordBg.arcWidth = 10.0;
                            rectForgotPasswordBg.arcHeight = 10.0;
                            label5.visible = true;
                            label5.layoutX = 28.0;
                            label5.layoutY = 15.0;
                            label5.text = "Password Reset";
                            label5.font = Arial_25;
                            label6.visible = true;
                            label6.layoutX = 75.0;
                            label6.layoutY = 85.0;
                            label6.text = "Admin Password";
                            label6.font = Arial_14;
                            label7.visible = true;
                            label7.layoutX = 50.0;
                            label7.layoutY = 0.0;
                            label7.text = "Username";
                            label7.font = Arial_14;
                            label7.textFill = DarkGray;
                            label8.visible = true;
                            label8.layoutX = 50.0;
                            label8.layoutY = 35.0;
                            label8.text = "Password";
                            label8.font = Arial_14;
                            label8.textFill = DarkGray;
                            label9.visible = true;
                            label9.layoutX = 50.0;
                            label9.layoutY = 75.0;
                            label9.text = "Confirm Password";
                            label9.font = Arial_14;
                            label9.textFill = DarkGray;
                            pwdReset.visible = true;
                            pwdReset.layoutX = 180.0;
                            pwdReset.layoutY = 35.0;
                            __layoutInfo_pwdReset.width = 200.0;
                            __layoutInfo_pwdReset.height = 25.0;
                            pwdReset.onKeyPressed = pwdResetOnKeyPressedAtForgotPassword;
                            pwdReset.promptText = "* * * * * * * * * * ";
                            pwdReset.font = Arial_14;
                            pwdResetConfirm.visible = true;
                            pwdResetConfirm.layoutX = 180.0;
                            pwdResetConfirm.layoutY = 75.0;
                            __layoutInfo_pwdResetConfirm.width = 200.0;
                            __layoutInfo_pwdResetConfirm.height = 25.0;
                            pwdResetConfirm.onKeyPressed = pwdResetConfirmOnKeyPressedAtForgotPassword;
                            pwdResetConfirm.promptText = "* * * * * * * * * * ";
                            pwdResetConfirm.font = Arial_14;
                            txtfgtUser.visible = true;
                            txtfgtUser.layoutX = 180.0;
                            txtfgtUser.layoutY = 0.0;
                            __layoutInfo_txtfgtUser.width = 200.0;
                            __layoutInfo_txtfgtUser.height = 25.0;
                            txtfgtUser.onKeyReleased = txtfgtUserOnKeyReleasedAtForgotPassword;
                            txtfgtUser.font = Arial_14;
                            listFUser.visible = false;
                            listFUser.opacity = 0.75;
                            listFUser.layoutX = 0.0;
                            listFUser.layoutY = 50.0;
                            panelfgtpwd.visible = false;
                            panelfgtpwd.layoutX = 25.0;
                            panelfgtpwd.layoutY = 140.0;
                            pwdAdmin.visible = true;
                            pwdAdmin.layoutX = 205.0;
                            __layoutInfo_pwdAdmin.width = 200.0;
                            __layoutInfo_pwdAdmin.height = 25.0;
                            pwdAdmin.onKeyPressed = pwdAdminOnKeyPressedAtForgotPassword;
                            pwdAdmin.promptText = "* * * * * * * * * *";
                            pwdAdmin.font = Arial_14;
                            separator2.visible = true;
                            separator2.layoutX = 28.0;
                            separator2.layoutY = 122.0;
                            __layoutInfo_separator2.width = 433.0;
                            __layoutInfo_separator2.height = 7.0;
                            btnBack.visible = true;
                            btnBack.layoutX = 75.0;
                            btnBack.layoutY = 280.0;
                            __layoutInfo_btnBack.width = 100.0;
                            __layoutInfo_btnBack.height = 30.0;
                            btnBack.effect = reflectionEffect;
                            btnBack.text = "Back";
                            btnBack.font = Arial_Bold_14;
                            btnBack.action = btnBackActionAtForgotPassword;
                            btnReset.visible = true;
                            btnReset.layoutX = 200.0;
                            btnReset.layoutY = 280.0;
                            __layoutInfo_btnReset.width = 100.0;
                            __layoutInfo_btnReset.height = 30.0;
                            btnReset.onKeyPressed = btnResetOnKeyPressedAtForgotPassword;
                            btnReset.effect = reflectionEffect;
                            btnReset.text = "Reset";
                            btnReset.font = Arial_Bold_14;
                            btnResetCancel.visible = true;
                            btnResetCancel.layoutX = 325.0;
                            btnResetCancel.layoutY = 280.0;
                            __layoutInfo_btnResetCancel.width = 100.0;
                            __layoutInfo_btnResetCancel.height = 30.0;
                            btnResetCancel.effect = reflectionEffect;
                            btnResetCancel.text = "Clear";
                            btnResetCancel.font = Arial_Bold_14;
                            btnGo.visible = true;
                            btnGo.layoutX = 407.0;
                            btnGo.layoutY = 84.0;
                            __layoutInfo_btnGo.height = 25.0;
                            btnGo.onKeyPressed = btnGoOnKeyPressedAtForgotPassword;
                            btnGo.text = "Go";
                            btnGo.font = Arial_Bold_14;
                            btnGo.action = btnGoActionAtForgotPassword;
                            panelForgotPassword.visible = true;
                            rectangleClienBG.visible = false;
                            rectangleClienBG.fill = javafx.scene.paint.Color.BLACK;
                            rectangleClienBG.stroke = null;
                            rectangleClienBG.strokeWidth = 1.0;
                            rectangleClienBG.width = 100.0;
                            rectangleClienBG.height = 50.0;
                            rectangleClienBG.arcWidth = 0.0;
                            rectangleClienBG.arcHeight = 0.0;
                            labelServer.visible = false;
                            labelServer.layoutX = 0.0;
                            labelServer.layoutY = 0.0;
                            labelServer.text = "Label";
                            labelServer.textFill = javafx.scene.paint.Color.BLACK;
                            txtServerAddress.visible = false;
                            txtServerAddress.layoutX = 0.0;
                            txtServerAddress.layoutY = 0.0;
                            labelServerIP.visible = false;
                            labelServerIP.layoutX = 0.0;
                            labelServerIP.layoutY = 0.0;
                            labelServerIP.text = "Label";
                            labelServerIP.textFill = javafx.scene.paint.Color.BLACK;
                            labelSeverPort.visible = false;
                            labelSeverPort.opacity = 1.0;
                            labelSeverPort.layoutX = 0.0;
                            labelSeverPort.layoutY = 0.0;
                            labelSeverPort.text = "Label";
                            labelSeverPort.textFill = javafx.scene.paint.Color.BLACK;
                            txtServerPort.visible = false;
                            txtServerPort.layoutX = 0.0;
                            txtServerPort.layoutY = 0.0;
                            txtServerPort.text = null;
                            buttonConnect.visible = false;
                            buttonConnect.layoutX = 0.0;
                            buttonConnect.layoutY = 0.0;
                            buttonConnect.text = "Button";
                            panelClient.visible = false;
                            panelAlert.visible = false;
                            panelAlert.blocksMouse = false;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectBgControlbuttons.opacity = 0.75;
                            rectLoginBG.opacity = 1.0;
                            rectLoginBG.effect = dropShadowEffect;
                            btnLogin.styleClass = "button";
                            btnCancel.styleClass = "button";
                            btnCancel.action = btnCancelAction;
                            lblforgotpwd.text = "Forgot your password ?";
                            lblforgotpwd.font = Arial_12;
                            imageView.layoutX = 8.0;
                            imageView.layoutY = 0.0;
                            imageView.fitWidth = 102.0;
                            imageView.fitHeight = 90.0;
                            listUser.opacity = 0.5;
                            lblRemainingDays.visible = false;
                            lblRemainWarning.visible = false;
                            lblRemainWarning.layoutX = 180.0;
                            lblRemainWarning.layoutY = 22.0;
                            lblRemainWarning.graphicHPos = javafx.geometry.HPos.LEFT;
                            lblRemainWarning.textFill = javafx.scene.paint.Color.BLACK;
                            panelLogin.visible = false;
                            panelLogin.onKeyPressed = panelLoginOnKeyPressedAtLogin;
                            rectForgotPasswordBg.visible = false;
                            rectForgotPasswordBg.opacity = 1.0;
                            rectForgotPasswordBg.layoutX = 13.0;
                            rectForgotPasswordBg.layoutY = 4.0;
                            rectForgotPasswordBg.strokeWidth = 1.0;
                            rectForgotPasswordBg.arcWidth = 0.0;
                            rectForgotPasswordBg.arcHeight = 0.0;
                            label5.visible = false;
                            label5.layoutX = 0.0;
                            label5.layoutY = 0.0;
                            label5.text = "Label";
                            label6.visible = false;
                            label6.layoutX = 41.0;
                            label6.layoutY = 78.0;
                            label6.text = "Label";
                            label7.visible = false;
                            label7.layoutX = 0.0;
                            label7.layoutY = 0.0;
                            label7.text = "Label";
                            label7.textFill = javafx.scene.paint.Color.BLACK;
                            label8.visible = false;
                            label8.layoutX = 49.0;
                            label8.layoutY = 98.0;
                            label8.text = "Label";
                            label8.textFill = javafx.scene.paint.Color.BLACK;
                            label9.visible = false;
                            label9.layoutX = 38.0;
                            label9.layoutY = 147.0;
                            label9.text = "Label";
                            label9.textFill = javafx.scene.paint.Color.BLACK;
                            pwdReset.visible = false;
                            pwdReset.layoutX = 154.0;
                            pwdReset.layoutY = 98.0;
                            pwdReset.promptText = null;
                            pwdResetConfirm.visible = false;
                            pwdResetConfirm.layoutX = 181.0;
                            pwdResetConfirm.layoutY = 147.0;
                            pwdResetConfirm.promptText = null;
                            txtfgtUser.visible = false;
                            txtfgtUser.layoutX = 137.0;
                            txtfgtUser.layoutY = 51.0;
                            listFUser.visible = false;
                            listFUser.opacity = 1.0;
                            listFUser.layoutX = 43.0;
                            listFUser.layoutY = 211.0;
                            panelfgtpwd.visible = false;
                            panelfgtpwd.layoutX = 61.0;
                            panelfgtpwd.layoutY = 124.0;
                            pwdAdmin.visible = false;
                            pwdAdmin.layoutX = 179.0;
                            pwdAdmin.promptText = null;
                            separator2.visible = false;
                            separator2.layoutX = 28.0;
                            separator2.layoutY = 109.0;
                            btnBack.visible = false;
                            btnBack.layoutX = 86.0;
                            btnBack.layoutY = 280.0;
                            btnBack.text = "Button";
                            btnReset.visible = false;
                            btnReset.layoutX = 187.0;
                            btnReset.layoutY = 274.0;
                            btnReset.text = "Button";
                            btnResetCancel.visible = false;
                            btnResetCancel.layoutX = 312.0;
                            btnResetCancel.layoutY = 274.0;
                            btnResetCancel.text = "Button";
                            btnGo.visible = false;
                            btnGo.layoutX = 0.0;
                            btnGo.layoutY = 0.0;
                            btnGo.text = "Button";
                            panelForgotPassword.visible = false;
                            rectangleClienBG.visible = true;
                            rectangleClienBG.fill = null;
                            rectangleClienBG.stroke = DarkGray;
                            rectangleClienBG.strokeWidth = 4.0;
                            rectangleClienBG.width = 500.0;
                            rectangleClienBG.height = 225.0;
                            rectangleClienBG.arcWidth = 10.0;
                            rectangleClienBG.arcHeight = 10.0;
                            labelServer.visible = true;
                            labelServer.layoutX = 80.0;
                            labelServer.layoutY = 13.0;
                            labelServer.text = "Server Configuration";
                            labelServer.font = Arial_25;
                            labelServer.textFill = Green;
                            txtServerAddress.visible = true;
                            txtServerAddress.layoutX = 180.0;
                            txtServerAddress.layoutY = 65.0;
                            __layoutInfo_txtServerAddress.width = 200.0;
                            __layoutInfo_txtServerAddress.height = 25.0;
                            txtServerAddress.font = Arial_14;
                            labelServerIP.visible = true;
                            labelServerIP.layoutX = 50.0;
                            labelServerIP.layoutY = 65.0;
                            labelServerIP.text = "Server Address";
                            labelServerIP.font = Arial_14;
                            labelServerIP.textFill = DarkGray;
                            labelSeverPort.visible = true;
                            labelSeverPort.opacity = 1.0;
                            labelSeverPort.layoutX = 50.0;
                            labelSeverPort.layoutY = 100.0;
                            labelSeverPort.text = "Server Port";
                            labelSeverPort.font = Arial_14;
                            labelSeverPort.textFill = DarkGray;
                            txtServerPort.visible = true;
                            txtServerPort.layoutX = 180.0;
                            txtServerPort.layoutY = 100.0;
                            __layoutInfo_txtServerPort.width = 200.0;
                            __layoutInfo_txtServerPort.height = 25.0;
                            txtServerPort.text = "20202";
                            txtServerPort.font = Arial_14;
                            buttonConnect.visible = true;
                            buttonConnect.layoutX = 200.0;
                            buttonConnect.layoutY = 163.0;
                            __layoutInfo_buttonConnect.width = 120.0;
                            __layoutInfo_buttonConnect.height = 30.0;
                            buttonConnect.text = "Connect";
                            buttonConnect.font = Arial_Bold_14;
                            buttonConnect.action = buttonConnactActionAtClient;
                            panelClient.visible = true;
                            panelAlert.visible = false;
                            panelAlert.blocksMouse = true;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main

 function Validate () : Boolean {
        var controller : LicenseController = new LicenseController () ;
        var val = new Validation();
        var valid : Boolean = false ;
        var portNoVal : Integer = val.getNumberValid(txtServerPort.rawText, 4, 5) ;
        var ipVal : Integer = 10;
//        ipVal = val.getNumberValid(txtServerAddress.rawText.replaceAll(".", ""), 4, 12) ;
        try {
            if (txtServerAddress.rawText.length() <= 0) {
                FXinfo ("Please Enter Server Address",txtServerAddress) ;
            } else if (ipVal != 10 ) {
                FXinfo ("Please Enter Valid IP for Server Address",txtServerAddress) ;
            } else if (txtServerPort.rawText.length() <= 0) {
                FXinfo ("Please Enter Port Address") ;
                txtServerPort.requestFocus();
            } else if (portNoVal == 0) {
                FXinfo ("Server Port can contain only Numbers") ;
                txtServerPort.requestFocus();
            } else if (portNoVal == 1) {
                FXinfo ("Server Port Cannot Exceed More Than 5 digits") ;
                txtServerPort.requestFocus();
            } else if (portNoVal == 11) {
                FXinfo ("Server Port can contain minimum of 4 digits") ;
                txtServerPort.requestFocus();
            } else if ( (serverPort = Integer.parseInt (txtServerPort.rawText)) <= 1024) {
                FXinfo ("Server Port can contain only Numbers above 1024") ;
            } else {
                valid = true ;
                if (txtServerAddress.rawText != serverHostIP or txtServerPort.rawText != serverPort.toString ()) {
                    if (controller.createServerDetails (txtServerAddress.rawText, serverPort)) {
                        var serverDetails = controller.getServerDetails() ;
                        serverHostIP = serverDetails.substring(0,serverDetails.indexOf(",")) ;
                        serverPort = Integer.parseInt (serverDetails.substring(serverDetails.indexOf(",")+1)) ;
                        txtServerAddress.text = serverHostIP ;
                        txtServerPort.text = serverPort.toString(); ;
                    } else {
                        FXinfo("Problem in creation of server details ");
                    }
                }
            }
        } catch (ne : java.lang.NumberFormatException) {
            log.debug("Please Enter valid Nubers for Port Address") ;
        }
        return valid ;
    }

    function buttonConnactActionAtClient(): Void {
          try {
            if(Validate()) {
            serverHostIP=txtServerAddress.rawText;
            serverPort=Integer.parseInt(txtServerPort.rawText);
            RegistryFactory.serverHostIP=serverHostIP;
            RegistryFactory.serverPort=serverPort;
            var clientRegistry : Registry = LocateRegistry.getRegistry(serverHostIP, serverPort);
            var commonController:CommonImplements  = clientRegistry.lookup("CommonImplementsStub") as CommonImplements ;
            if (commonController.hashCode() != 0) {
              callLogin();
            } else {
                FXinfo("Please start the Server/Connection Error");
            }
            }
            } catch (e : java.rmi.ConnectException) {
                FXinfo("Please start the Server/Connection Error");
        } catch (e : Exception) {
                log.debug(e.getMessage());
        }
       }

    function btnResetOnKeyPressedAtForgotPassword(event: javafx.scene.input.KeyEvent): Void {
        btnResetAction();
         }
    var panelMsgBoxLX=bind CommonDeclare.panelMsgBoxLX;
    var panelMsgBoxLY=bind CommonDeclare.panelMsgBoxLY;
    var panelLoginLX= bind (ScreenWidth-Login.rectLoginBG.width-((7.8125*ScreenWidth)/100));
    var panelLoginLY= bind ScreenHeight-Login.rectLoginBG.height-((13.02083333*ScreenHeight)/100);
    var panelFgtPwdLX=bind (ScreenWidth-Login.rectForgotPasswordBg.width-((7.8125*ScreenWidth)/100));
    var panelFgtPwdLY= bind (ScreenHeight-Login.rectForgotPasswordBg.height-((13.02083333*ScreenHeight)/100));
    var imgLogoLX=bind CommonDeclare.imgLogoLX;
    var imgLogoLY=bind CommonDeclare.imgLogoLY;
    //Etown Logo configurations
    /*var imgEtownLogoLX = bind CommonDeclare.imgEtownLogoLX;
    var imgEtownLogoLY = bind CommonDeclare.imgEtownLogoLY;
    var imgEtownVanLogoLX = bind CommonDeclare.imgEtownVanLogoLX;
    var imgEtownVanLogoLY = bind CommonDeclare.imgEtownVanLogoLY;*/
    var rectBgControlbuttonsLX= bind (ScreenWidth-100);
    var rectBgControlbuttonsLY=0.0;
    def CustomAlert = CustomAlert {};
    function showAlertbox(): Void {
        panelMsgBox.visible = true;
        delete  panelMsgBox.content;
        insert CustomAlert.getDesignRootNodes() into panelMsgBox.content;
        CustomAlert.show();
    }
    public var status:String="" on replace{
        if(not status.equals("")){
        CustomAlert.ShowInfo("Login", status);
        showAlertbox();
        status="";
        }
    }

    function btnCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
      if(event.code==KeyCode.VK_ENTER){
      Msgbox("Confirm",CommonDeclare.exit_msg);}
         }
    function btnLoginOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_ENTER){
       userLogin();}
         }
    function btnGoOnKeyPressedAtForgotPassword(event: javafx.scene.input.KeyEvent): Void {
        ShowForgetPass();
         }

    function btnGoActionAtForgotPassword(): Void {
        ShowForgetPass();
         }
    function imageBackgroundOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        listFUser.visible=false;
        listUser.visible=false;
         }
    function pwdResetConfirmOnKeyPressedAtForgotPassword(event: javafx.scene.input.KeyEvent): Void {
         }
    function pwdResetOnKeyPressedAtForgotPassword(event: javafx.scene.input.KeyEvent): Void {
         }
    function txtPasswordOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        listUser.visible = false;
         if (event.code == KeyCode.VK_ENTER) {
            userLogin();
         }
         }
    function btnCancelAction(): Void {
               Msgbox("Confirm", CommonDeclare.exit_msg);
         }

    function btnCancelActionAtLogin(): Void {
         Msgbox("Confirm",CommonDeclare.exit_msg);
         }

     function txtfgtUserOnKeyReleasedAtForgotPassword(event: javafx.scene.input.KeyEvent): Void {
        getFGUsers(event);
        if(event.code==KeyCode.VK_DOWN){
            listFUser.visible = true;
            listFUser.requestFocus();
            listFUser.selectFirstRow();
        }
      }
    function panelLoginOnKeyPressedAtLogin(event: javafx.scene.input.KeyEvent): Void {
            if(event.code == KeyCode.VK_F2)
            {
                userLogin();
            }
         }
    function btnResetAction(): Void {
     if(panelForgotPassword.visible)
        {
            var usrname = txtfgtUser.rawText.trim();
            var pass = pwdReset.rawText.trim();
             if(not GetUserInfo.checkName(usrname))
             {
                 if(pass.equals(pwdResetConfirm.rawText.trim()))
                 {
                     var retVal =1;// DBData.queryExecution("UPDATE user_info SET password='{pass}' WHERE user_name='{uname}'");
                     status="Password for {usrname} has been modified successfully";
                     if(retVal==1)
                     {
                         currentState.actual = currentState.findIndex("Login");
                         txtUser.requestFocus();
                     }
                 }else{
                   status="Confirm password does not match with Password ..!";
                 }
             }else{
                 status="Invalid User name ..!";
             }
        }
    }

    function btnResetCancelAction(): Void {
        if(panelForgotPassword.visible)
        {
            txtfgtUser.text = "";
            pwdReset.text = "";
            pwdResetConfirm.text = "";
            txtfgtUser.requestFocus();
        }
    }

    function pwdAdminOnKeyPressedAtForgotPassword(event: javafx.scene.input.KeyEvent): Void {
     if(event.code==KeyCode.VK_ENTER)
        {
            ShowForgetPass();
        }
    }
function ShowForgetPass():Void{

}

    function txtUserOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        getUsers(event);
        if(event.code==KeyCode.VK_DOWN){
            listUser.visible = true;
            listUser.requestFocus();
            listUser.selectFirstRow();
        }else if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_TAB){
            listUser.visible = false;
            txtPassword.requestFocus();
        }

    }

    function btnLoginAction(): Void {
         userLogin();
         }

    function btnBackActionAtForgotPassword(): Void {
        currentState.actual = currentState.findIndex("Login");
         }

    function lblforgotpwdOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        currentState.actual = currentState.findIndex("ForgotPassword");
         }
    function lblfgtpwdOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
         lblforgotpwd.font = Arial_12;
          lblforgotpwd.textFill=Gray;
         }

    function lblfgtpwdOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        lblforgotpwd.font = Arial_Bold_12;
        lblforgotpwd.textFill=DarkGray;
         }

        
 function getUsers(evt: javafx.scene.input.KeyEvent):Void{
    listH = 0.0 ;
    listW = 0.0 ;
    listUser.visible = true;
    listUser.layoutX =  txtUser.layoutX;
    listUser.layoutY =  txtUser.layoutY + txtUser.height- 2.5;
    listW =  txtUser.width ;
     listUser.items = GetUserInfo.getUserName(txtUser.rawText.trim()).toArray() as String[];
    listUser.onKeyPressed = function(e){
        if(e.code==KeyCode.VK_ENTER or e.code==KeyCode.VK_TAB)
        {

               if (not listUser.selectedItem.equals(null)){
               txtUser.text = "{listUser.selectedItem}";
                listUser.visible = false;
                txtPassword.requestFocus();
}
        }
        if(e.code==KeyCode.VK_ESCAPE)
        {
            listUser.visible = false;
            txtUser.requestFocus();
        }
    }
    listUser.onMouseClicked= function(e){
            txtUser.text = "{listUser.selectedItem}";
            listUser.visible = false;
            txtPassword.requestFocus();
    }



    for(i in[1..listUser.items.size()])
    {
        listH+= 26.0;
    }
if(evt.code==KeyCode.VK_ESCAPE)
    listUser.visible = false;

}
 function getFGUsers(evt: javafx.scene.input.KeyEvent):Void{
    listH = 0.0 ;
    listW = 0.0 ;
    listFUser.visible = true;

    listFUser.layoutX =  txtfgtUser.layoutX;
    listFUser.layoutY =  txtfgtUser.layoutY + txtfgtUser.height;

    listW =  txtfgtUser.width  ;

     listFUser.items = GetUserInfo.getUserName(txtfgtUser.rawText.trim()).toArray() as String[];


    listFUser.onKeyPressed = function(e){
        if(e.code==KeyCode.VK_ENTER or e.code==KeyCode.VK_TAB)
        {

                txtfgtUser.text = "{listFUser.selectedItem}";
                listFUser.visible = false;
                pwdReset.requestFocus();

        }
        if(e.code==KeyCode.VK_ESCAPE)
        {
            listFUser.visible = false;
            txtfgtUser.requestFocus();
        }
    }
    listFUser.onMouseClicked= function(e){
            txtfgtUser.text = "{listFUser.selectedItem}";
            listFUser.visible = false;
            pwdReset.requestFocus();
    }
var ss = listFUser.items.size();
if(ss>5)
{
    ss = 5;
}
for(i in[1..ss])
 {
  listH+= 25.0;
 }
if(evt.code==KeyCode.VK_ESCAPE)
    listFUser.visible = false;

}


function  userLogin():Void{
     try {
            uname = txtUser.rawText.trim();
            var pwd   = txtPassword.rawText.trim();
            var users:String = GetUserInfo.getUsers(uname);            
            if(uname!=null and pwd!=null and uname!="" and pwd!="") {
                if(uname.equalsIgnoreCase(users) and pwd.equals(GetUserInfo.getPassword(uname))){LoginSuccess();}
                else if(uname.equalsIgnoreCase("MedeilAdmin") and pwd.equals(AdminAuth.getAdminpwd())) {
                    LoginSuccess();
                } else {
                    status="Invalid User name or Password !";
                    txtPassword.text="";
                    txtPassword.requestFocus();
                    loginProgress.visible = false;
                }
            } else {
                status="Please enter a valid User name and Password to Login..!";
            }
     } catch(ex : Exception) {
         var msg: String = "Class : Login Method : userLogin()   = {ex.getMessage()}";
         log.debug(msg);
     }
}
function LoginSuccess():Void{
    try{
            CommonDeclare.user=uname;            
            CommonDeclare.userType=GetUserInfo.getUserType(uname);
            CommonDeclare.tin=GetUserInfo.getTIN();
            ResetAll();
            panel.visible=false;
            try {
                var getUserInfo : GetUserInfo = new GetUserInfo();
                var commonController = RegistryFactory.getClientStub("CommonImplementsStub") as CommonImplements;
                var lIP = (InetAddress.getLocalHost()).getHostAddress();
                ses_id=getUserInfo.getSessionID();
                var query = "CALL pro_userLogin('{uname}','{ses_id}', '{lIP}')";
                commonController.queryExecution(query);
            }catch(e1:Exception){
                log.debug("Login loginSuccess userLogBlock Exception:{e1.getMessage()}");
            }
             fss = true;

            }catch(e:Exception){
                  var msg: String = "Class : Login Method : LoginSuccess()   = {e.getMessage()}";
       log.debug(msg);
            }
}

 function showAlertbox1(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Settings", msg);
        showAlertbox1();

    }
    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Client Settings", msg);
        showAlertbox1();
        err_txtbox.requestFocus();
    }
public function ResetAll():Void{
    txtUser.requestFocus();
    txtUser.text="";
    txtPassword.text="";
    pwdAdmin.text="";
    txtfgtUser.text="";
    pwdReset.text="";
    pwdResetConfirm.text="";
    }

public function Msgbox(type:String,Message:String):Void{
    panelMsgBox.visible=true;
    delete panelMsgBox.content;
     MessageBox.MsgBox("Login",type,Message);
     insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
     ExitMedeil=true;
}
 var msgOutput:Integer=bind MessageBox.msgboxOutput  on replace{
       if(msgOutput==1 and ExitMedeil==true){
      javafx.lang.FX.exit();
     }
 }
public function callLogin():Void{
    panel.visible=true;
    txtUser.requestFocus();
    currentState.actual = currentState.findIndex("Login");
    var commonController : CommonImplements=RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;

    CommonDeclare.shopName=" {commonController.ShopName()} ";
}
 function settingLoad ():Void {
        var controller : LicenseController = new LicenseController () ;
        var serverDetails = controller.getServerDetails() ;
        if (serverDetails == "" or serverDetails == null) {
            Validate ();
        }
        serverHostIP = serverDetails.substring(0,serverDetails.indexOf(",")) ;
        serverPort = Integer.parseInt(serverDetails.substring(serverDetails.indexOf(",")+1)) ;
        txtServerAddress.text = serverHostIP ;
        txtServerPort.text = serverPort.toString();

        currentState.actual = currentState.findIndex("Client");
    }
public function Startup(): Void {

    /*var serverDetails: String = GetUserInfo.getServerDetails();
    var serverHostIP: String = serverDetails.substring(0, serverDetails.indexOf(",")); //"192.168.1.2";
    var serverPort: Integer = Integer.parseInt(serverDetails.substring(serverDetails.indexOf(",") + 1)); //20202;
    var ping: String = "";
    var pingCmd: String = "ping {serverHostIP}";
    var network: Boolean = false;
    try {
        var ia: InetAddress = InetAddress.getByName(serverHostIP);
        println("{RegistryFactory.class}  :  {ia}.isReachable(100) = {ia.isReachable(100)}");
        network = ia.isReachable(100);
        println("a/f isReachable(100) network =  {network}");
        if (network) {
            network = true;
        } else if (not network) {
            network = ia.isReachable(500);
        } else if (not network) {
            network = ia.isReachable(1000);
        } else {
            network = true;
        }
        println("b/f ping network = {network}");
        if (not network) {
            var r: Runtime = Runtime.getRuntime();
            println("pingCmd =  {pingCmd}");
            var p: Process = r.exec(pingCmd);
            var in: BufferedReader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            var inputLine: String;
            while ((inputLine = in.readLine()) != null) {
                ping += inputLine;
            }
            in.close();
            println("ping = {ping}");
            if(ping.length() > 10) {
                var rec: String = ping.substring(ping.indexOf("Received =") + 11, ping.indexOf("Lost") - 2);
                if (rec != null and rec != "" and Integer.parseInt(rec) > 0) {
                    network = true;
                } else {
                    network = false;
                }
            }
            println("a/f ping network = {network}");
        }
    } catch (e4: UnknownHostException) {
        log.debug("Method:PingIp UnknownHostException:{e4.getMessage()}");
    } catch (e4: IOException) {
        log.debug("Method:PingIp IOException:{e4.getMessage()}");
    } catch( e: Exception ) {
        log.debug("Method:PingIp Exception:{e.getMessage()}");
    }
    if (not network) {
        JOptionPane.showMessageDialog(null, "Server is not available Please check Server with this IP :{serverHostIP} and Port:{serverPort }has been run or not");
        log.debug("Server ({serverHostIP} and Port:{serverPort }) has been disconnected or IP has been changed switch off or medeil is closed");
    }*/

    if (RegistryFactory.errCnt > 0) {
        settingLoad();
    } else {
        callLogin();
    }

}

}
