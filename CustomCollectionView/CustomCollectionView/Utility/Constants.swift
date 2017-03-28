//
//  Constants.swift
//  CustomCollectionView
//
//  Created by Domalwar, Pravin on 23/03/17.
//  Copyright © 2017 Domalwar, Pravin. All rights reserved.
//

import Foundation
import UIKit

let crittersimAppID =  "9868f5c7a17f48b189a438bbca4397d000555300"

enum EventBookingRows {
    
    case header,bookingDay,bookingTime, duration
    static let allValues = [header,bookingDay, bookingTime,duration]
    static let sectionTitles = [
        header : "When Does your event start?",
        bookingDay: "When",
        bookingTime: "Time",
        duration: "Duration"
    ]
    
    func title() -> String {
        if let sectionTitle = EventBookingRows.sectionTitles[self] {
            return sectionTitle
        } else {
            return ""
        }
    }
}

let cricelButtonSize:CGFloat = 130.0;
let itemsPerRow: CGFloat = 2
let hSpacingCollectionCell: CGFloat = 30;

//Time Slot
let morningTimeSlot = ["8:30\nAM","9:30\nAM","10\nAM"]
let afternoonTimeSlot = ["12:30\nPM","1:30\nPM","2\nPM","3\nPM"]
let eveningTimeSlot = ["7:30\nPM","8:30\nPM","10\nPM","10:30\nPM"]


