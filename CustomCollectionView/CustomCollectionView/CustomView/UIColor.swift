//
//  UIColor.swift
//  CustomCollectionView
//
//  Created by Domalwar, Pravin on 23/03/17.
//  Copyright © 2017 Domalwar, Pravin. All rights reserved.
//

import Foundation
import UIKit


// - extending UIColor to work with hex values
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int ,alphaVal:Float = 1) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alphaVal))
    }
    
    convenience init(netHex:Int,alpha:Float = 1) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff , alphaVal:alpha)
    }
    
    class func tabYellowColor() -> UIColor {
        return UIColor(netHex: 0xFBD54B)
    }
    class func tableGrayColor() -> UIColor {
        return UIColor(netHex: 0xECECEC)
    }
    class func shuttleBlueColor() -> UIColor {
        return UIColor(netHex: 0x1FBCEC)
    }
}
