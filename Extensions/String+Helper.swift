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
  
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    var isEmailAddress: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
      
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    var isPhoneNumber: Bool {
        let phoneRegEx = "^\\d{3}-\\d{3}-\\d{4}$"
      
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
    var isStrongPass: Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6,}$"
        let passTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
      
        return passTest.evaluate(with: self)
    }
  
    func convertToDate()-> Date {
        var date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var dateString = self
      
        if dateString == "0000-00-00 00:00:00" {
            dateString = "1900-01-01 00:00:00"
            date = formatter.date(from: dateString)!
        }else {
            date = formatter.date(from: dateString)!
        }
      
        return date
    }
    func convertToDateCurrentTimeZone()-> Date {
        var date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.calendar = NSCalendar.current
        formatter.timeZone = TimeZone(abbreviation: "UTC")
      
        var dateString = self
      
        if dateString == "0000-00-00 00:00:00" {
            dateString = "1900-01-01 00:00:00"
            date = formatter.date(from: dateString)!
        }else {
            print(dateString)
            date = formatter.date(from: dateString)!
            print(date)
          
        }
        return date
    }
    func localToUTC(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
      
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone(abbreviation: "MDT")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
      
        return dateFormatter.string(from: dt!)
    }
  
    func convertTo10DigitPhone()-> String?{
        if self.count == 15 {
            var indexOfText = self.index(self.startIndex, offsetBy: 3)
            let substring1 = self[indexOfText...]
          
            indexOfText = self.index(self.endIndex, offsetBy: -9)
            var first3Digits = substring1[..<indexOfText]
          
            indexOfText = self.index(substring1.endIndex, offsetBy: -4)
            let last4Digits = substring1[indexOfText..<substring1.endIndex]
          
            indexOfText = self.index(substring1.startIndex, offsetBy: 4)
            let secondIndex = self.index(substring1.endIndex, offsetBy: -5)
            let second3Digits = substring1[indexOfText..<secondIndex]
          
            first3Digits.append(contentsOf: second3Digits)
            first3Digits.append(contentsOf: last4Digits)
            let editedPhone: String = String(first3Digits)
            return editedPhone
        }else {
            return nil
        }
    }
  
    func heightForText(_ font: UIFont, width: CGFloat) -> CGFloat {
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(rect.height)
    }
  
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
  
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
  
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
  
        enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }

    func isValid(regex: RegularExpressions) -> Bool {
        return isValid(regex: regex.rawValue)
    }

    func isValid(regex: String) -> Bool {
        let matches = range(of: regex, options: .regularExpression)
        return matches != nil
    }

    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter{CharacterSet.decimalDigits.contains($0)}
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }

    func makeAColl() {
        if isValid(regex: .phone) {
            if let url = URL(string: "tel://\(self.onlyDigits())"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
  
    
}
