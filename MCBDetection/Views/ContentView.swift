//
//  ContentView.swift
//  MCBDetection
//
//  Created by Ayesha Siddiqua on 14/02/24.
//

import SwiftUI
import Vision
import UIKit

struct ContentView: View {
    
    @ObservedObject var vm: ViewModel
   // var mcbDetails = MCBDetails.all()
   // var mcbDetails1 = MCBDetails.all1()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("MCB Detection")
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                Spacer()
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:.infinity)
                        .opacity(0.5)
                        .overlay(
                           // ScrollView {
                                Grid {
                                    GridRow {
                                        VStack(alignment:.leading, spacing: -20) {
                                            //Rows
                                            ForEach(0 ..< 2){ index  in
                                                Text("    Row \(index + 1)")
                                                   // .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:.infinity)
                                                    .frame(width:UIScreen.main.bounds.width - 50,height: 50,alignment: .leading)
                                                    .foregroundStyle(.gray)
                                                    .background(.white)
                                                    .padding(.leading, 60)
                                                
                                                HStack(spacing:1) {
                                                    //Columns
                                                    ForEach(index == 0 ? vm.classification1 : vm.classification2, id: \.self) { item in
                                                        MCBCellView(name: "Kitchen", mcbLabel: item)
                                                    }
                                                   }.padding(.leading, 50)
                                                    .padding(.trailing)
                                                }.padding()
                                            }
                                        }
                                    }.frame(width:UIScreen.main.bounds.width - 50)
                              //  }
                           ).frame(width:UIScreen.main.bounds.width - 50,height: 350)
                }else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.6)
                        .frame(width:350,height: 400)
                }
                Spacer()
                
               /*
                VStack{
                    if vm.isImageUploaded{
                        VStack(alignment:.leading, spacing: 5) {
                            //Rows
                            ForEach(0 ..< 2){ index  in
                                Text("Row \(index + 1): ")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.black)
                                    .fontWeight(.bold)
                                
                                VStack(spacing: 5) {
                                    //Columns
                                    Text(index == 0 ? vm.classification1.joined(separator: ", ") : vm.classification2.joined(separator: ", "))
                                        .font(.system(size: 12))
                                }
                            }
                        }
                    }
                }
                Spacer()
                */
                
                VStack(spacing: 10) {
                    Button("Open Camera") {
                        vm.source = .camera
                        vm.showPicker = true
                    }.padding()
                        .foregroundColor(.white)
                        .background(Color(red: 128/255, green: 128/255, blue: 128/255))
                        .cornerRadius(10)
                    
                    Button("Upload Photo") {
                        vm.source = .library
                        vm.showPicker = true
                        
                    }.padding()
                        .foregroundColor(.white)
                        .background(Color(red: 128/255, green: 128/255, blue: 128/255))
                        .cornerRadius(10)
                }
                Spacer()
            }.sheet(isPresented: $vm.showPicker) {
                ImagePicker(vm: vm, selectedImage: $vm.image, sourceType: vm.source == .library ? .photoLibrary : .camera)
            }
        }.onChange(of:vm.isImageUploaded) {
            print("Image uploaded")
        }
    }
    
    
}

