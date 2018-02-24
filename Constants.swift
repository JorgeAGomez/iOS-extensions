//
//  Constants.swift
//
//  Created by Jason Lee on 2017-08-04.
//  Copyright © 2017 Vog App Developers. All rights reserved.
//

import Foundation
import UIKit

// Completion Handlers
typealias DownloadComplete = (Bool) -> ()
typealias Completed = () -> ()
typealias UploadComplete = (Bool) -> ()

// These strings will be set at compile-time based on the scheme setting (Debug or Release)
// Make sure Active Compilation Conditions under Build Settings has DEBUG set for the Debug item.
#if DEBUG
    let SERVER_API_BASE_URL = "https://PUT_YOUR_STAGING_URL_HERE"
#else
    let SERVER_API_BASE_URL = "https://PUT_YOUR_PRODUCTION_URL_HERE"
#endif

// Enumerations
enum iphoneSizes: CGFloat {
    case iPhone4, iPhone5, iPhone6, iPhone7, iPhone8, iPhone6s, iPhone7s, iPhone8s, iPhoneX
    
    func width() -> CGFloat {
        switch self {
        case .iPhone4:
            return 320
        case .iPhone5:
            return 320
        case .iPhone6:
            return 375
        case .iPhone7:
            return 375
        case .iPhone8:
            return 375
        case .iPhone6s:
            return 414
        case .iPhone7s:
            return 414
        case .iPhone8s:
            return 414
        case .iPhoneX:
            return 375
        }
    }
    
    func height() -> CGFloat {
        switch self {
        case .iPhone4:
            return 480
        case .iPhone5:
            return 568
        case .iPhone6:
            return 667
        case .iPhone7:
            return 667
        case .iPhone8:
            return 667
        case .iPhone6s:
            return 736
        case .iPhone7s:
            return 736
        case .iPhone8s:
            return 736
        case .iPhoneX:
            return 812
        }
    }
}

// Constants
let kScreenBounds = UIScreen.main.bounds
let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
