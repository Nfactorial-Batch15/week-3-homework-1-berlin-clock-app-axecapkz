//
//  BerlinClockLogic.swift
//  Berlin Clock App
//
//  Created by Azamat Kenjebayev on 12/14/21.
//

import SwiftUI

class BerlinClock {
    
    func berlinClock(hours: Int , minutes: Int, seconds: Int) -> String {
        return calcSeconds(seconds: seconds) + calcHours(hours: hours) + calcSingleFiveMinutes(minutes: minutes)
    }
    
    func calcSeconds(seconds: Int) -> String {
        return seconds % 2 == 0 ? "Y" : "O"
    }

    func calcMinutes(_ index: Int) -> String {
        return index % 3 == 0 ? "R" : "Y"
    }
    
    func calcSingleFiveMinutes(minutes: Int) -> String {
        let fiveMinutesLamps = minutes / 5
        let singleMinutesLamps = minutes % 5
        
        var sfM: [String] = []
        
        for n in 1...11 {
            sfM.append(n <= fiveMinutesLamps ? calcMinutes(n) : "O")
        }
        
        sfM.append(calcRows(allLamps: 4, lampIsOn: singleMinutesLamps, status: "Y"))
        
        return sfM.compactMap { $0 as String }.joined()
    }
    
    func calcHours(hours: Int) -> String {
        let fiveHourLamps = hours / 5
        let singleHourLamps = hours % 5
        
        var sfH: [String] = []
        sfH.append(calcRows(allLamps: 4, lampIsOn: fiveHourLamps, status: "R"))
        sfH.append(calcRows(allLamps: 4, lampIsOn: singleHourLamps, status: "R"))
        
        return sfH.compactMap { $0 as String }.joined()
    }
    
    
    func calcRows(allLamps: Int, lampIsOn: Int, status: String) -> String {
        var rows: [String] = []
        
        for n in 1...allLamps {
            rows.append(n <= lampIsOn ? status : "O")
        }

        return rows.compactMap { $0 as String }.joined()
    }
    
}
