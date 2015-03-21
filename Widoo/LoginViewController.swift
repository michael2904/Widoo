//
//  LoginViewController.swift
//  Widoo
//
//  Created by Michael Abdallah-Minciotti on 2015-03-20.
//  Copyright (c) 2015 Michael Abdallah-Minciotti. All rights reserved.
//  Joseph add
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var rememberMeBut: UISwitch!
    @IBOutlet weak var navBar: UINavigationItem!

    var actInd:UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.actInd)
        
        
    
    }
    
    //IOS touch functions
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        // called when 'return' key pressed. return NO to ignore
        
        textField.resignFirstResponder();
        
        return true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if(PFUser.currentUser() != nil){
            PFUser.logOut()
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginAction(sender: AnyObject) {
        
        var username = self.usernameField.text
        var password = self.passwordField.text
        
        if(username.utf16Count < 6 || password.utf16Count < 8){
            var alert = UIAlertView(title: "Invalide", message: "L'identifiant doit avoir plus de 6 charactères et le mot de passe plus de 8 charactères", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
        }else{
            self.actInd.startAnimating()
            
            PFUser.logInWithUsernameInBackground(username, password: password, block: { (user, error) -> Void in
           
                self.actInd.stopAnimating()
                
                if((user) != nil){
                    var alert = UIAlertView(title: "Connecté", message: "Vous êtes connecté", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                    self.navBar.backBarButtonItem?.title = "Se deconnecter"
                    self.passwordField.text = ""
                    if !self.rememberMeBut.on {
                        self.usernameField.text=""
                    }
                    self.performSegueWithIdentifier("connected", sender: self)


                }else{
                    var alert = UIAlertView(title: "Erreur", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                }
            
            })
        }
        
    }

    @IBAction func SignUp(sender: AnyObject) {
        navBar.backBarButtonItem?.title = "Se connecter"

        self.performSegueWithIdentifier("signUp", sender: self)
        
    }

}
