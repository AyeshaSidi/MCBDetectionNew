//
//  LabellingRowView.swift
//  MCBModel
//
//  Created by Ayesha Siddiqua on 21/05/24.
//

import SwiftUI

struct LabellingRowView: View {
    
    //@StateObject var vm: ViewModel
    //@State var selectedItem:  [String]
    @Binding var isShowing: Bool
    @State var mcbDetails : [MCBDetails]?
   // var arrayOfmcbDetailsDic: [Int: [MCBDetails]] = [:]
    @State var isItemSelected: Bool = false
    @State var selectedIndexValue: Int
    @State var isShowingApplication = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isShowing = false
                    self.mcbDetails?.removeAll()
                })
                {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.white)
                }.padding(.leading, 10)
                    .padding(.trailing, 40)
                    .padding()
                Text("Labelling row \(selectedIndexValue + 1)")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Spacer()
            }.frame(width: UIScreen.main.bounds.width)
                .background(Color.green)
            Spacer()
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:1) {
                    if let dictionary = mcbDetails {
                        ForEach(dictionary, id:\.id) { item in
                            MCBCellView(mcbDetails: item)
                            .foregroundColor(isItemSelected ? Color.blue : Color.black)
                            .onTapGesture {
                                isItemSelected = true
                            }
                    }
                }
                    else {
                         
                    }
                }//.frame(width:UIScreen.main.bounds.width - 70)
                    .padding(.leading)
                    .padding(.trailing)
            }//.padding()
            Spacer()
            /*
             HStack {
             Spacer()
             Button(action: {
             
             })
             {
             Image(systemName: "arrow.backward.circle")
             .foregroundColor(.white)
             }.frame(width: 150, height: 150)
             .padding(.trailing,30)
             
             Button(action: {
             
             })
             {
             Image(systemName: "arrow.right.circle")
             .foregroundColor(.white)
             }.frame(width: 150, height: 150)
             Spacer()
             }.background(Color.black.opacity(0.2))
             */
            Spacer()
            Text("MODULE CONFIGURATION")
                .padding(.bottom, 30)
           // NavigationLink(destination: ApplicationListView(isShowingApplication: $isShowingApplication),isActive: $isShowingApplication) {
                HStack {
                    Text("Application")
                        .foregroundColor(.black)
                    Spacer()
                    //HStack {
                        Text(mcbDetails?.first?.name ?? "")
                   
//                        Button(action: {
//                            
//                        })
//                        {
//                            Image(systemName: "arrow.forward")
//                                .foregroundColor(.black)
//                                .frame(width: 150, height: 150)
//                        }
                    
                   // }
                }.padding(.trailing,30)
                    .padding(.leading, 30)
           // }
            Divider()
            HStack {
                Text("Location")
                Spacer()
                Text(mcbDetails?.first?.areaName ?? "")
            }.padding(.trailing,30)
                .padding(.leading, 30)
            Divider()
            HStack {
                Text("Reference number")
                Spacer()
                Text(mcbDetails?.first?.referenceNumber ?? "")
            }.padding(.trailing,30)
                .padding(.leading, 30)
            Spacer()
            
            Button(action: {
                
                //print("Button Tapped")
            }){
                Text("Save the row")
                    .foregroundColor(.white)
                
            }.frame(width: UIScreen.main.bounds.width - 40, height: 50)
                .background(Color.green)
                .cornerRadius(5)
            Spacer()
        }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear() {
                print("index value \(mcbDetails)")
            }
            .onDisappear() {
                self.mcbDetails?.removeAll()
            }
    }
}


