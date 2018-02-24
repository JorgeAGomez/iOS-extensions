//
//  UIColor+Helper.swift
//
//  Created by Jorge Gomez on 2018-01-28
//  Copyright © 2017 Vog App Developers. All rights reserved.
//  From Brian --> 'Lets build that app' Youtube Channel.


import Foundation

extension UIColor {
  
    //create new colors without modifying alpha.
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(r: r, g: g, b: b, a: 1)
    }
  
    // Create new colors fast and easy and modify alpha.
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
}
