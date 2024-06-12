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
    @Published var classification1 : [String] =  []
    @Published var classification2 : [String] = []
    
}
