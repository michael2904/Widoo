//
//  ProfilViewController.swift
//  Widoo
//
//  Created by Michael Abdallah-Minciotti on 2015-03-20.
//  Copyright (c) 2015 Michael Abdallah-Minciotti. All rights reserved.
//

import UIKit

class ProfilViewController: UIViewController {
    
    
    @IBOutlet weak var usernameLbl: UILabel!
    
    var actInd:UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150)) as UIActivityIndicatorView

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.actInd)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func infoBut(sender: AnyObject) {
        self.performSegueWithIdentifier("info", sender: nil)
    }
    override func viewDidAppear(animated: Bool) {
        
        var user = PFUser.currentUser()
        
        //usernameLbl.text = user.username
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //IOS touch functions
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        // called when 'return' key pressed. return NO to ignore
        
        textField.resignFirstResponder();
        
        return true
    }


}
