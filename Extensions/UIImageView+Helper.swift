//
//  UIImage+Helper.swift
//  Arc
//
//  Created by Jorge Gomez on 2018-02-11.
//  Copyright © 2018 ARC. All rights reserved.
//

import Foundation
import UIKit



extension UIImageView {

    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode) {
        contentMode = mode
      
        // ------------------
        // ACTIVITY INDICATOR
        // ------------------
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        self.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        // SETS THE AI RIGHT IN THE MIDDLE USING HORIZONTAL AND VERTICAL AXIS. 
        let horizontalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        self.addConstraint(horizontalConstraint)
        let verticalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        self.addConstraint(verticalConstraint)
      
        activityIndicator.startAnimating()
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { () -> Void in
                activityIndicator.stopAnimating()
                self.image = image
            }
        }.resume()
    }
  
  
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode) {
        guard let url = URL(string: link) else { return self.image = #imageLiteral(resourceName: "icon_picture") }
        downloadedFrom(url: url, contentMode: mode)
    }
  
    func fixImageCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
  
    
  
    func downloadedFromWithCompletion(url: URL, contentMode mode: UIViewContentMode, completed: @escaping () -> ()) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
                completed()
            }
        }.resume()
    }
}
