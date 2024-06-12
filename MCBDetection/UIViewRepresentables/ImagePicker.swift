//
//  ImagePicker.swift
//  MCBDetection
//
//  Created by Ayesha Siddiqua on 14/02/24.
//

import SwiftUI
import Vision
import CoreML

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var vm: ViewModel
    @Binding var selectedImage: UIImage?
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, viewmodel: vm)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePicker
        var viewModel: ViewModel
        var detector = ObjectDetection(vm: ViewModel())
        
        init(_ parent: ImagePicker, viewmodel: ViewModel) {
            self.parent = parent
            self.viewModel = viewmodel
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
                //Converting the UIImage to CIImage
                if let ciImage = CIImage(image: parent.selectedImage!) {
                  detector.detectAndProcess(image: ciImage)
                    //viewModel.isImageUploaded = true
                    viewModel.classification1 = detector.row1Labels
                    viewModel.classification2 = detector.row2Labels
                }
                else {
                    print("CIImage convert error")
                }
                parent.presentationMode.wrappedValue.dismiss()
                
            }
           
        }
        
    }
    
}
