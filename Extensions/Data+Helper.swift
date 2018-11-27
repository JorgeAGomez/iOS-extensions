//
//  Data+Helper.swift
//  X-ing Paths
//
//  Created by Jorge Gomez on 2018-04-14.
//  Copyright © 2018 Nerd Lab Software. All rights reserved.
//

import Foundation


extension Data
{
    func toString() -> String
    {
        return String(data: self, encoding: .utf8)!
    }
}
