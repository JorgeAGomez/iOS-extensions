//
//  NSMutableAttributedString+Helper.swift
//
//  Created by Jorge Gomez on 2018-01-28
//  Copyright © 2017 Vog App Developers. All rights reserved.
//  From Brian --> 'Lets build that app' Youtube Channel.

import Foundation

extension NSMutableAttributedString {
    
    public func appendNewLine() {
        append(NSAttributedString(string: "\n"))
    }
    
    public func centerAlignWithSpacing(_ lineSpacing: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = lineSpacing
        setParagraphStyle(paragraphStyle: paragraphStyle)
    }
    
    public func setLineSpacing(_ lineSpacing: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        setParagraphStyle(paragraphStyle: paragraphStyle)
    }
    
    func setParagraphStyle(paragraphStyle: NSParagraphStyle) {
        let range = NSMakeRange(0, string.count)
        addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: range)
    }
}
