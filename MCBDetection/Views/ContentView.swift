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
    
    @ObservedObject var vm = ViewModel()
    @State var isShowingDetail = false
    @State var mcbDetails : [MCBDetails] = []
    @State var index = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("MCB Detection")
                    .foregroundStyle(Color.green)
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .padding(.top)
                Spacer()
                if let image = vm.image {
                    if vm.classification1.count > 0 {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:.infinity)
                            .opacity(0.5)
                        
                            .overlay(
                                Grid {
                                    GridRow {
                                        VStack(alignment:.leading, spacing: 5) {
                                            //Rows
                                            
                                            ForEach(vm.classification1.indices, id: \.self){ row  in
                                                NavigationLink(destination:LabellingRowView(isShowing: $isShowingDetail, mcbDetails: vm.arrayOfmcbDetailsDic[row] ?? [], selectedIndexValue: row),  isActive: $isShowingDetail) {
                                                    HStack {
                                                        Image(systemName: "pencil")
                                                            .resizable()
                                                            .foregroundColor(.black)
                                                            .frame(width: 15, height: 15, alignment: .leading)
                                                            .padding(.leading)
                                                        Text("Edit the row \(row + 1)")
                                                            .foregroundStyle(.black)
                                                            .fontWeight(.light)
                                                        
                                                        
                                                    }.frame(width:UIScreen.main.bounds.width - 70,height: 30,alignment: .leading)
                                                        .background(.white)
                                                        .cornerRadius(3)
                                                        .padding(.top,15)
                                                }
                                                ScrollView(.horizontal, showsIndicators: false) {
                                                    HStack(spacing:1) {
                                                        //Columns
                                                        ForEach(vm.classification1[row], id: \.self) { column in
                                                           MCBCellView(mcbDetails: vm.all(rowNumber: row, referenceNumber: column))
                                                        
                                                        }
                                                    }
                                                }
                                            }
                                           
                                        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:.infinity)
                                    }.padding(.bottom,30)
                                }.frame(width:UIScreen.main.bounds.width - 70)
                                
                            ).frame(width:UIScreen.main.bounds.width - 50,height: 350)
                        
                            //.padding(.leading,20)
                    }
                    else {
                        Text("NO MCB FOUND")
                            .foregroundStyle(Color.green)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                    }
                }
                else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.6)
                        .frame(width:350,height: 400)
                        .foregroundStyle(Color.green)
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
                        .background(Color.green)
                        .cornerRadius(10)
                    
                    Button("Upload Photo") {
                        vm.source = .library
                        vm.showPicker = true
                        
                    }.padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                Spacer()
            }.sheet(isPresented: $vm.showPicker) {
                ImagePicker(vm: vm, selectedImage: $vm.image, sourceType: vm.source == .library ? .photoLibrary : .camera)
            }
            
        }.onChange(of:vm.isImageUploaded) {
            print("Image uploaded")
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .background(Color.gray)
    }
    
    
}

