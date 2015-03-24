//
//  SignUpViewController.swift
//  Widoo
//
//  Created by Michael Abdallah-Minciotti on 2015-03-20.
//  Copyright (c) 2015 Michael Abdallah-Minciotti. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    var actInd:UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150)) as UIActivityIndicatorView

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.actInd)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func isValidEmail(testStr:String) -> Bool {
        println(testStr)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let range = testStr.rangeOfString(emailRegEx, options:.RegularExpressionSearch)
        println(range)
        let result = range != nil ? true : false
        println(result)
        return result
    }

    @IBAction func signUpAction(sender: AnyObject) {
        
        var username = self.usernameField.text
        var password = self.passwordField.text
        var email = self.emailField.text
        
        if(username.utf16Count < 6 || password.utf16Count < 8){
            var alert = UIAlertView(title: "Invalide", message: "L'identifiant doit avoir plus de 6 charactères et le mot de passe plus de 8 charactères", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
        }else if (!isValidEmail(email)){
            var alert = UIAlertView(title: "Email invalide", message: "Ce n'est pas un email valide", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }else{
            
            self.actInd.startAnimating()
            
            var newUser = PFUser()
            
            newUser.username = username
            newUser.password = password
            newUser.email = email
            newUser["distance"] = 0
            newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
            
                self.actInd.stopAnimating()
                
                if((error) != nil){
                    var alert = UIAlertView(title: "Erreur", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                }else{
                    var alert = UIAlertView(title: "Succès", message: "Inscrit", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                }
                
            })
            
        }
    }
}
