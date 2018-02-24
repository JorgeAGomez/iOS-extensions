//
//  String+Helper.swift
//  Arc
//
//  Created by Jorge Gomez on 2018-02-11.
//  Copyright © 2018 ARC. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var firstUppercased: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
}
