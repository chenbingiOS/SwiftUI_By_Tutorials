//
//  FlightHistory.swift
//  MountainAirport
//
//  Created by mtAdmin on 2021/6/7.
//

import Foundation
import SwiftUI

class FlightHistory: NSObject {
    public var day: Int
    public var flightId: Int
    public var date: Date
    public var direction: FlightDirection
    public var status: FlightStatus
    public var scheduledTime: Date
    public var actualTime: Date?
    
    public var shortDate: String {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d"
            return formatter.string(from:  date)
        }
    }
    
    public var timeDifference: Int {
        get {
            guard let actual = actualTime else { return 60 }
            let diff = Calendar.current.dateComponents([.minute], from: scheduledTime, to: actual)
            return diff.minute!
        }
    }
    
    public var flightDelayDescription: String {
        if status == .cancelled {
            return FlightStatus.cancelled.rawValue
        }
        
        if timeDifference < 0 {
            return "Early by \(-timeDifference) minutes."
        } else if timeDifference == 0 {
            return FlightStatus.ontime.rawValue
        } else {
            return "Late by \(timeDifference) minutes"
        }
    }
    
    public var delayColor: Color {
        if status == .cancelled {
            return Color(red: 0.5, green: 0, blue: 0)
        }
        if timeDifference <= 0 {
            return Color.green
        }
        if timeDifference <= 15 {
            return Color.yellow
        }
        return Color.red
    }
    
    public func calcOffset(_ width: CGFloat) -> CGFloat {
        return CGFloat(day - 1) * width
    }
    
    init(_ day: Int, id: Int, date: Date, direction: FlightDirection, status: FlightStatus, scheduledTime: Date, actualTime: Date?) {
        self.day = day
        self.flightId = id
        self.date = date
        self.direction = direction
        self.status = status
        self.scheduledTime = scheduledTime
        self.actualTime = actualTime
    }
}
