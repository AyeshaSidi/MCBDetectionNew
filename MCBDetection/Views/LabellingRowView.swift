//
//  LabellingRowView.swift
//  MCBModel
//
//  Created by Ayesha Siddiqua on 21/05/24.
//

import SwiftUI

struct LabellingRowView: View {
    
    @State var selectedItem: MCBDetails?
    @Binding var isShowing: Bool
    var mcbDetails = MCBDetails.all()
    var mcbDetails1 = MCBDetails.all1()
    var mcbDetails2 = MCBDetails.all2()
   @State var index: Int
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isShowing = false
                    index = 0
                })
                {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.white)
                }.padding(.leading, 10)
                    .padding(.trailing, 40)
                    .padding()
                Text("Labelling row \(index + 1)")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Spacer()
            }.frame(width: UIScreen.main.bounds.width)
                .background(Color.green)
            Spacer()
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:1) {
                    ForEach(index == 0 ? mcbDetails : index == 1 ? mcbDetails1 : mcbDetails2, id: \.self) { item in
                        MCBCellView(mcbDetails: item, name: item.areaName)
                            .onTapGesture {
                                selectedItem = item
                                print("Cell Tapped \(String(describing: selectedItem))")
                            }
                    }
                }.frame(width: UIScreen.main.bounds.width - 10)
                    .padding(.leading)
            }.padding()
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
           // NavigationLink(destination: ApplicationListView()) {
                HStack {
                    Text("Application")
                    Spacer()
                    HStack {
                        Text("")
                        Button(action: {
                            
                        })
                        {
                            Image(systemName: "arrow.forward")
                                .foregroundColor(.black)
                                .frame(width: 150, height: 150)
                        }
                    }.padding(.trailing,30)
                }
          //  }
            Divider()
            HStack {
                Text("Location")
                Spacer()
                Text("")
            }
            Divider()
            HStack {
                Text("Reference number")
                Spacer()
                Text("")
            }
            Spacer()
            
            Button(action: {
                
                print("Button Tapped")
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
                print("index value \(index)")
            }
    }
}


