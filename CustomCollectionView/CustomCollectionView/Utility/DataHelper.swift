//
//  DataHelper.swift
//  CustomCollectionView
//
//  Created by Domalwar, Pravin on 23/03/17.
//  Copyright © 2017 Domalwar, Pravin. All rights reserved.
//

import Foundation
import AFDateHelper


class EventBookingDataHelper {
    
    class func getTimeArraybasedOn(date:Date)-> [String]{
        
        var timeArray = [String]()
        
        if date.compare(.isToday) {
            // Check what time is it of today and give necessary options
            let hour = Calendar.current.component(.hour, from: Date())
            if hour <= 7 {
                timeArray = morningTimeSlot + afternoonTimeSlot + eveningTimeSlot
            } else if hour <= 10  {
                timeArray = afternoonTimeSlot + eveningTimeSlot
            } else if hour <= 16 {
                timeArray = eveningTimeSlot
            }
        } else {
            timeArray = morningTimeSlot + afternoonTimeSlot + eveningTimeSlot
        }
        
        return timeArray
    }
    
    class func getEventDay()-> [String]{
        let when = ["Today","Tomorrow","InTwoDay ","In a week","In Two week"]
        return when;
    }
    
    class func getEventDuration()-> [String]{
        let duration = ["30 MIN","1 HR","1HR 30Min ","2 HR"]
        return duration;
    }

}

class EventTypeDataHelper {

    
    class func getEventTypeTitle()-> String{
        return "GREAT! \nWHERE DOES THIS EVENT TAKE PLACE?"
    }
    
    class func getEventType()-> [String]{
        let duration = ["Happy Hour", "Volunteer", "Lunch", "Coffee Chat","Dinner","ERG"]
        return duration;
    }
    
}

