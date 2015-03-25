//
//  Coupon.swift
//  CouponsTable
//
//  Created by Michael Abdallah-Minciotti on 2015-03-24.
//  Copyright (c) 2015 Michael Abdallah-Minciotti. All rights reserved.
//

import Foundation

class Coupon{
    
    var label = "label"
    var image = "blank"
    var progress:Float = 0.0
    var description = "description"
    
    init(name:String, imageName:String, progressVal:Float,descVal: String){
        self.label = name
        self.image = imageName
        self.progress = progressVal
        self.description = descVal
    }
    
}