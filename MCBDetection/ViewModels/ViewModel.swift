//
//  ViewModel.swift
//  MCBDetection
//
//  Created by Ayesha Siddiqua on 14/02/24.
//

import SwiftUI
import Vision
import CoreML

class ViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var isImageUploaded = false
    @Published var source: Picker.Source = .library
   // @Published var classification1 : [[String]]?
    @Published var classification1: [[String]] = [[]]
    var arrayOfmcbDetailsDic: [Int: [MCBDetails]] = [:]
   // @Published var classification2 : [String] = []
    let logos = ["air.conditioner.horizontal", "air.purifier", "lightbulb.max", "oven", "lightswitch.on.square", "dryer", "dishwasher"]
    let applicationNames = [ "Cooler","Geyser","Lighting", "Baking oven", "SPD switch", "Machine", "Dishwasher"]
    let areaNames = ["Hall", "Bedroom", "Kitchen", "Utility", "Corridor", "Terrace"]
    
    
    func all(rowNumber: Int, referenceNumber: String) ->   MCBDetails {
        
        let keyToUpdate = rowNumber
        let item = MCBDetails(logo:  self.logos.randomElement()!, name: self.applicationNames.randomElement()!, areaName: self.areaNames.randomElement()!,referenceNumber: referenceNumber)
        if var arrayToUpdate = arrayOfmcbDetailsDic[rowNumber] {
            
            arrayToUpdate.append(item)
            arrayOfmcbDetailsDic[keyToUpdate] = arrayToUpdate
        }
        else {
           
               arrayOfmcbDetailsDic[keyToUpdate] = [item]
            print("&&&&&&&&&&&&&&&&&&&\(arrayOfmcbDetailsDic)")
            
        }
        
       // print("***** row\(rowNumber) Referencenumber \(referenceNumber)")
       // print(arrayOfmcbDetailsDic)
        return item
            
    }
    
    
}
