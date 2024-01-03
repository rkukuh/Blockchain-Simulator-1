//
//  Date+Extension.swift
//  Blockchain Simulator 1
//
//  Created by R. Kukuh on 03/01/24.
//

import Foundation

extension Date {
    func getFormattedDateAndRelativeDescription() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MMM/dd hh:mm:ssa"
        dateFormatter.amSymbol = "am"
        dateFormatter.pmSymbol = "pm"
        
        let calendar = Calendar.current
        let now = Date()
        let fullDate = dateFormatter.string(from: self)
        
        if calendar.isDateInYesterday(self) {
            return "Yesterday (\(fullDate))"
        } else if calendar.isDateInToday(self) {
            let components = calendar.dateComponents([.hour, .minute], from: self, to: now)
            if let hour = components.hour, hour > 0 {
                return "\(hour) hours ago (\(fullDate))"
            } else if let minute = components.minute, minute > 0 {
                return "\(minute) minutes ago (\(fullDate))"
            } else {
                return "Just now (\(fullDate))"
            }
        } else {
            let components = calendar.dateComponents([.day, .weekOfYear], from: self, to: now)
            if let week = components.weekOfYear, week > 0 {
                return "\(week) weeks ago (\(fullDate))"
            } else if let day = components.day, day > 0 {
                return "\(day) days ago (\(fullDate))"
            } else {
                return fullDate
            }
        }
    }
}
