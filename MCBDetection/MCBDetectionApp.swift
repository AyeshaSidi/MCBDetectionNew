//
//  MCBDetectionApp.swift
//  MCBDetection
//
//  Created by Ayesha Siddiqua on 14/02/24.
//

import SwiftUI

@main
struct MCBDetectionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: ViewModel())
                //.environmentObject(ViewModel())
        }
    }
}
