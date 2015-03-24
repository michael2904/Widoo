//
//  ViewController.swift
//  CouponsTable
//
//  Created by Michael Abdallah-Minciotti on 2015-03-24.
//  Copyright (c) 2015 Michael Abdallah-Minciotti. All rights reserved.
//

import UIKit

class CouponsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    

    @IBOutlet weak var distanceVal: UILabel!
    @IBOutlet weak var myTableView: UITableView!

    
    var arrayOfCoupons: [Coupon] = [Coupon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUpCoupons()
        //let curUser = PFUser.currentUser()
        //let userDist = curUser["distance"] as String
        distanceVal.text = "30 km"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpCoupons(){
        
        var coupon1 = Coupon(name: "Sports Expert 20% off",imageName: "SportExpert.png",progressVal: 0.3)

        var coupon2 = Coupon(name: "Sports Expert 40% off", imageName: "SportExpert.png",progressVal: 0.2)
        
        var coupon3 = Coupon(name: "LuluLemon 20% off",imageName: "LuluModified.png",progressVal: 0.3)
        
        arrayOfCoupons.append(coupon1)
        arrayOfCoupons.append(coupon2)
        arrayOfCoupons.append(coupon3)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfCoupons.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: CouponsTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as CouponsTableViewCell
        
            cell.backgroundColor = UIColor.grayColor()
       
        
        let coupon = arrayOfCoupons[indexPath.row]
        
        cell.setCell(coupon.label, imageView: coupon.image, progressValue: coupon.progress)
        
        return cell
        
        
        
    }

}

