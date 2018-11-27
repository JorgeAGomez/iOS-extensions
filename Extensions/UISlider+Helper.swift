//
//  UISlider+Helper.swift
//  X-ing Paths
//
//  Created by Jorge Gomez on 2018-05-05.
//  Copyright © 2018 Nerd Lab Software. All rights reserved.
//

import Foundation
import UIKit

extension UISlider {

    var trackBounds: CGRect {
        return trackRect(forBounds: bounds)
    }
  
    var trackFrame: CGRect {
        guard let superView = superview else { return CGRect.zero }
        return self.convert(trackBounds, to: superView)
    }
  
    var thumbBounds: CGRect {
        return thumbRect(forBounds: frame, trackRect: trackBounds, value: value)
    }
  
    var thumbFrame: CGRect {
        return thumbRect(forBounds: bounds, trackRect: trackFrame, value: value)
    }
  
}
