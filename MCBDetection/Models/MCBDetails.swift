//
//  MCBDetails.swift
//  MCBModel
//
//  Created by Ayesha Siddiqua on 20/02/24.
//

import Foundation
import SwiftUI

struct MCBDetails: Identifiable,Hashable {
    var id = UUID()
    var logo:String
    var name:String
    var areaName: String
    var referenceNumber: String
}


extension MCBDetails {
    static func all() -> [MCBDetails] {
        return [
            MCBDetails(logo:  "lightswitch.on", name: "SPD Switch", areaName: "Kitchen", referenceNumber: "E29F21109"),
            MCBDetails(logo: "lightbulb", name: "Light", areaName: "Hall", referenceNumber: "E29F21111"),
            MCBDetails(logo: "air.conditioner.horizontal", name: "Air Conditioner", areaName: "Bedroom", referenceNumber: "E29F21123"),
            MCBDetails(logo: "lightswitch.on", name: "Socket", areaName: "Utility", referenceNumber: "E29F21145")
        ]
    }
    
    static func all1() -> [MCBDetails] {
        return [
            MCBDetails(logo:  "lightbulb", name: "Baking", areaName: "Kitchen", referenceNumber: "E29F21109"),
            MCBDetails(logo: "lightbulb", name: "Gas", areaName: "Hall", referenceNumber: "E29F21111"),
            MCBDetails(logo: "air.conditioner.horizontal", name: "Water Heater", areaName: "Bedroom", referenceNumber: "E29F21123"),
            MCBDetails(logo: "lightswitch.on", name: "Switch", areaName: "Utility", referenceNumber: "E29F21145"),
            MCBDetails(logo: "lightbulb", name: "Socket", areaName: "Utility", referenceNumber: "E29F21145"),
            MCBDetails(logo: "lightbulb", name: "Light", areaName: "Utility", referenceNumber: "E29F21145")
        ]
    }
    /*
    static func all2() -> [MCBDetails] {
        return [
            MCBDetails(logo:  "lightbulb", name: "Light", areaName: "Kitchen", referenceNumber: "E29F21109"),
            MCBDetails(logo: "alarm.fill", name: "Alarm", areaName: "Hall", referenceNumber: "E29F21111"),
            MCBDetails(logo: "folder", name: "Motor", areaName: "Bedroom", referenceNumber: "E29F21123"),
            MCBDetails(logo: "lightswitch.on", name: "Smart Switch", areaName: "Utility", referenceNumber: "E29F21145"),
            MCBDetails(logo: "lightbulb", name: "Socket", areaName: "Utility", referenceNumber: "E29F21145"),
        ]
    }
     */
}

