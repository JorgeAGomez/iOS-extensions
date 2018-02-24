//
//  NSAttributedString+Helper.swift
//  Arc
//
//  Created by Jorge Gomez on 2018-02-11.
//  Copyright © 2018 ARC. All rights reserved.
//

import Foundation
import UIKit


extension NSAttributedString {

    // Recognize HTML tags in a text and apply the tags to the label selected.
    internal convenience init?(html: String) {
      //font-size: 14
      let htmlWithFont = "<span style=\"font-family: Titillium Web; \">\(html)</span>"
      guard let data = htmlWithFont.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }

      guard let attributedString = try? NSMutableAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) else {
        return nil
      }

      self.init(attributedString: attributedString)
    }
  
    // Recognize HTML tags in a text and apply the tags to the label selected.
    internal convenience init?(html: String, fontName: String, fontSize: String) {
      let htmlWithFont = "<span style=\"font-family: \(fontName); font-size: \(fontSize) \">\(html)</span>"
      guard let data = htmlWithFont.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }

      guard let attributedString = try? NSMutableAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) else {
        return nil
      }

      self.init(attributedString: attributedString)
    }
}
