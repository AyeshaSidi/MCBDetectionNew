//  NQ Detect
//
//  Created by NULL on 10/9/22.
//

import AVFoundation
import Vision
import CoreImage
import SwiftUI

class ObjectDetection: ObservableObject {
    
   @Published var row1Labels: [[String]] = []
   var row2Labels: [String] = []
   @ObservedObject var vm = ViewModel()
    var detectionRequest:VNCoreMLRequest!
    var ready = false
    
    init(vm: ViewModel){
        self.vm = vm
        Task { self.initDetection() }
        
    }
    
    func initDetection(){
        do {
            let model = try VNCoreMLModel(for: best(configuration: MLModelConfiguration()).model)
            
            self.detectionRequest = VNCoreMLRequest(model: model)
            
            self.ready = true
            
        } catch let error {
            fatalError("failed to setup model: \(error)")
        }
    }
    
   func detectAndProcess(image:CIImage)-> [[String]]{
        
        let observations = self.detect(image: image)
        
        let processedObservations = self.processObservation(observations: observations, viewSize: image.extent.size)
        print("processedObservations",processedObservations)
      // print("processedObservations Count",processedObservations.count)
       
      /*
       var highestDifferenceIndex = 0
        var highestDifference: Double = 0

        for i in 1..<sortedDict.count {
            let currentDifference = sortedDict[i].boundingBox.minY - sortedDict[i-1].boundingBox.minY
            if currentDifference > highestDifference {
                highestDifference = currentDifference
                highestDifferenceIndex = i
            }
        }
        let row1 = Array(sortedDict[..<highestDifferenceIndex])
        let row2 = Array(sortedDict[highestDifferenceIndex...])
//        print("ROW1",row1)
//        print("ROW2",row2)
        let sortedRow1 = row1.sorted(by: {$0.boundingBox.minX < $1.boundingBox.minX})
        let sortedRow2 = row2.sorted(by: {$0.boundingBox.minX < $1.boundingBox.minX})
        row1Labels = sortedRow1.map{ String($0.label)}
        row2Labels = sortedRow2.map{ String($0.label)}
        print("RowLabel1",row1Labels)
        print("Rowlabel2", row2Labels)
       */
      // var sortedY1 = output.map { $0 }.sorted { ($0["box"][1] as! Double) < ($1["box"][1] as! Double) }

      // print(sortedY1)
       let sortedY1 = processedObservations.sorted(by: {$0.boundingBox.minY < $1.boundingBox.minY})
      // print("Sorted Dictionary",sortedY1)
       var rows: [[ProcessedObservation]] = []
       var currentRow: [ProcessedObservation] = []
       let threshold: Double = 30.0
       for i in 0..<sortedY1.count {
           if currentRow.isEmpty {
               currentRow.append(sortedY1[i])
           } else {
               let yDiff = sortedY1[i].boundingBox.minY - currentRow.last!.boundingBox.minY
               if yDiff < threshold {
                   currentRow.append(sortedY1[i])
               } else {
                   currentRow.reverse()
                   rows.append(currentRow)
                   currentRow = [sortedY1[i]]
                  
               }
           }
       }
       if !currentRow.isEmpty {
          var sortedRow =  currentRow.sorted(by: {$0.boundingBox.minX > $1.boundingBox.minX})
           sortedRow.reverse()
           rows.append(sortedRow)
       }

//       for var row in rows {
//        row.sort { ($0.boundingBox.minX) > ($1.boundingBox.minX)}
//       }

      let finalRows: [[String]] = rows.map { row in
           return row.map { box in
               return box.label
           }
       }
      
       row1Labels = finalRows
       print(row1Labels)
       vm.classification1 = row1Labels
        return row1Labels
    }
    
    
    func detect(image:CIImage) -> [VNObservation]{
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do{
            try handler.perform([self.detectionRequest])
            let observations = self.detectionRequest.results!
            
            return observations
            
        }catch let error{
            fatalError("failed to detect: \(error)")
        }
        
    }
    
    
    func processObservation(observations:[VNObservation], viewSize:CGSize) -> [ProcessedObservation]{
       
        var processedObservations:[ProcessedObservation] = []
        
        for observation in observations where observation is VNRecognizedObjectObservation {
            
            let objectObservation = observation as! VNRecognizedObjectObservation
            
            let objectBounds = VNImageRectForNormalizedRect(objectObservation.boundingBox, Int(viewSize.width), Int(viewSize.height))
            
            let flippedBox = CGRect(x: objectBounds.minX, y: viewSize.height - objectBounds.maxY, width: objectBounds.maxX - objectBounds.minX, height: objectBounds.maxY - objectBounds.minY)
           // print("FlippedBox Row",flippedBox.minX)
           // print("FlippedBox column",flippedBox.minY)
            let label = objectObservation.labels.first!.identifier
            //print("Label",label)
            let processedOD = ProcessedObservation(label: label, confidence: objectObservation.confidence, boundingBox: flippedBox)
            
            processedObservations.append(processedOD)
        }
       
        
        return processedObservations
        
    }
    
}

struct ProcessedObservation{
    var label: String
    var confidence: Float
    var boundingBox: CGRect
}
