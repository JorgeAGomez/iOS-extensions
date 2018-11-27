//
//  Date+Helper.swift
//  X-ing Paths
//
//  Created by Jorge Gomez on 2018-07-13.
//  Copyright © 2018 Nerd Lab Software. All rights reserved.
//

import Foundation

extension Date {

  func dateAt(hours: Int, minutes: Int) -> Date {
    
    let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
    
    //get the month/day/year componentsfor today's date.
    var date_components = calendar.components(
      [NSCalendar.Unit.year,
       NSCalendar.Unit.month,
       NSCalendar.Unit.day],
      from: self)

    //Create an NSDate for the specified time today.
    date_components.hour = hours
    date_components.minute = minutes
    date_components.second = 0

    let newDate = calendar.date(from: date_components)!
    return newDate
  }
  
}
