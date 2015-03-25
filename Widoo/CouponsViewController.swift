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
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using [segue destinationViewController].
        var detailScene = segue.destinationViewController as CouponDetailViewController
        
        // Pass the selected object to the destination view controller.
        if let indexPath = self.myTableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            detailScene.currentObject = objects[row] as? PFObject
        }
    }
    
    func setUpCoupons(){
        
        var coupon1 = Coupon(name: "Sports Expert 20% off",imageName: "SportExpert.png",progressVal: 1.0, descVal:"Besoin de 20km pour debloquer")

        var coupon2 = Coupon(name: "Sports Expert 40% off", imageName: "SportExpert.png",progressVal: 0.75, descVal:"Besoin de 40km pour debloquer")
        
        var coupon3 = Coupon(name: "LuluLemon 20% off",imageName: "LuluModified.png",progressVal: 0.6, descVal:"Besoin de 50km pour debloquer")
        
        arrayOfCoupons.append(coupon1)
        arrayOfCoupons.append(coupon2)
        arrayOfCoupons.append(coupon3)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfCoupons.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: CouponsTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as CouponsTableViewCell
        
<<<<<<< HEAD
            cell.backgroundColor = UIColor.lightGrayColor()
=======
            cell.backgroundColor = UIColor.whiteColor()
>>>>>>> adding-profile-info
       
        
        let coupon = arrayOfCoupons[indexPath.row]
        
        cell.setCell(coupon.label, imageView: coupon.image, progressValue: coupon.progress, descText: coupon.description)
        
        if coupon.progress == 1.0{
            cell.couponLock.image = UIImage(named:"")
        }else{
            cell.couponLock.image = UIImage(named:"Lock")

        }
        
        return cell
        
        
        
    }

}

