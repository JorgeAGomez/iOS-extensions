//
//  UITextField+Helper.swift
//  Vieworx
//
//  Created by Jorge Gomez on 2018-11-26.
//  Copyright © 2018 Vog App Developers. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
  
  func setLeftPaddingPoints(_ amount:CGFloat){
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.leftView = paddingView
    self.leftViewMode = .always
  }
  
  func setRightPaddingPoints(_ amount:CGFloat) {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.rightView = paddingView
    self.rightViewMode = .always
  }
  
}
