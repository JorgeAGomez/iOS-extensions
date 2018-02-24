//
//  UserDefaults.swift
//
//  Created by JasonVOG on 2017-08-22.
//  Copyright © 2017 Vog App Developers. All rights reserved.
//
/*
 Useage: In AppDelegate declare let userData = UserData(), this gives you a strong reference throughout
        the lifecycle of the application
*/

import Foundation

class UserData {
    
    var dataFile: String = ""
    var apiToken: String = ""
    
    init() {
        registerDefaults()
    }
    
    // Helper Methods
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        dataFile = "paavaa_user.plist"
        return documentsDirectory().appendingPathComponent(dataFile)
    }

    func registerDefaults() {
        let dictionary: [String: Any] = [ "APIToken": "" ]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    func setAPIToken(token: String) {
        UserDefaults.standard.set(token, forKey: "APIToken")
    }
    
    func getAPIToken() -> String {
        if let token = UserDefaults.standard.string(forKey: "APIToken") {
            return token
        }
        return ""
    }
}
