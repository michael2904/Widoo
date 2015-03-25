//
//  CouponsTableViewCell.swift
//  CouponsTable
//
//  Created by Michael Abdallah-Minciotti on 2015-03-24.
//  Copyright (c) 2015 Michael Abdallah-Minciotti. All rights reserved.
//

import UIKit

class CouponsTableViewCell: PFTableViewCell {
    
    @IBOutlet weak var couponLabel: UILabel!
    @IBOutlet weak var couponImage: PFImageView!
    @IBOutlet weak var couponProgress: UIProgressView!
    @IBOutlet weak var couponDesc: UILabel!
    @IBOutlet weak var couponLock: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(labelText:String, imageView:String, progressValue:Float,descText: String){
        
        self.couponLabel.text = labelText
        self.couponImage.image = UIImage(named: imageView)
        self.couponProgress.setProgress(progressValue, animated: true)
        self.couponDesc.text = descText
    }

}
