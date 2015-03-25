//
//  DetailViewController.swift
//  ParseTutorial
//
//  Created by Ian Bradbury on 06/02/2015.
//  Copyright (c) 2015 bizzi-body. All rights reserved.
//

import UIKit

class CouponDetailViewController: UIViewController {
	
	// Container to store the view table selected object
	var currentObject : PFObject?
	
	// Some text fields
	@IBOutlet weak var nameEnglish: UITextField!
	@IBOutlet weak var nameLocal: UITextField!
	@IBOutlet weak var capital: UITextField!
	@IBOutlet weak var currencyCode: UITextField!
	
	
	// The save button
	@IBAction func saveButton(sender: AnyObject) {
		
		// Unwrap the current object object
		if let object = currentObject? {
			
			object["nameEnglish"] = nameEnglish.text
			object["nameLocal"] = nameLocal.text
			object["capital"] = capital.text
			object["currencyCode"] = currencyCode.text

			// Save the data back to the server in a background task
			object.saveEventually(nil)
			
		}
		
		// Return to table view
		self.navigationController?.popViewControllerAnimated(true)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Unwrap the current object object
		if let object = currentObject? {
			nameEnglish.text = object["nameEnglish"] as String
			nameLocal.text = object["nameLocal"] as String
			capital.text = object["capital"] as String
			currencyCode.text = object["currencyCode"] as String
		}
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
	
}
