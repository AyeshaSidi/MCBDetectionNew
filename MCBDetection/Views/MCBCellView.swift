//
//  MCBCellView.swift
//  MCBModel
//
//  Created by Ayesha Siddiqua on 20/02/24.
//

import SwiftUI


/*
struct MCBCellView: View {
    
   // var mcbDetails: MCBDetails
    @State var name: String
    var mcbLabel:String
    
    var body: some View {
        VStack(alignment:.center) {
            VStack(spacing:5) {
                Image(systemName: "lightbulb")
                    .resizable()
                    .frame(width: 15,height: 15, alignment: .center)
                    .foregroundColor(.green)
                    .padding(.top,3)
                Text("Gas")
                    .foregroundStyle(.green)
                    .font(.system(size: 9))
                    .lineLimit(1)
                EditableLabel($name, onEditEnd: { print("New name is *\(name)* ") } )
                    .foregroundStyle(.white)
                    .background(.green)
                    .font(.system(size: 7))
            }.padding(.top,2)
                .padding(.bottom,10)
            VStack {
                Text("Ref No:")
                    .foregroundStyle(.gray)
                    .font(.system(size: 6))
                Text(mcbLabel)
                    .foregroundStyle(.gray)
                    .font(.system(size: 5))
                    .fontWeight(.light)
                    .lineLimit(1)
            }.padding(.bottom, 10)
        }.frame(width: labelValues(rowLabel: mcbLabel))
        //.frame(minWidth: 0, maxWidth: .infinity)
            .background(.white)
    }
}

*/
/*
struct MCBCellView: View {

   // var mcbDetails: MCBDetails?
    @State var logo: String
    @State var applicationName: String
    @State var areaName: String
    @State var mcbLabel:String
    
    
    var body: some View {
            VStack(alignment:.center) {
                VStack(spacing:5) {
                    Image(systemName: logo)
                        .resizable()
                        .frame(width: 15,height: 15, alignment: .center)
                        .foregroundColor(.green)
                        .padding(.top,3)
                    Text(applicationName)
                        .foregroundStyle(.green)
                        .font(.system(size: 9))
                        .lineLimit(1)
                    EditableLabel($areaName, onEditEnd: { print("New name is *\(areaName)* ") } )
                        .foregroundStyle(.white)
                        .background(.green)
                        .font(.caption2)
                }.padding(.top,2)
                    .padding(.bottom,10)
                VStack {
                    Text("Ref No:")
                        .foregroundStyle(.gray)
                        .font(.system(size: 10))
                    Text(mcbLabel)
                        .foregroundStyle(.gray)
                        .font(.system(size: 8))
                        .fontWeight(.light)
                        .lineLimit(1)
                }.padding(.bottom, 10)
            }.frame(width: labelValues(rowLabel: mcbLabel))
                .background(.white)
    }
}
*/
 
struct MCBCellView: View {

   // var mcbDetails: [Int: [MCBDetails]]
    var mcbDetails: MCBDetails
    @State var logo = ""
    @State var name = ""
    @State var applicationName = ""
    @State var referenceNumber = ""
//    @State var logo: String
//    @State var applicationName: String
//    @State var areaName: String
//    @State var mcbLabel:String
    
    
    var body: some View {
            VStack(alignment:.center) {
                VStack(spacing:5) {
                    Image(systemName: logo)
                        .resizable()
                        .frame(width: 15,height: 15, alignment: .center)
                        .foregroundColor(.green)
                        .padding(.top,3)
                    Text(applicationName)
                        .foregroundStyle(.green)
                        .font(.system(size: 9))
                        .lineLimit(1)
                    EditableLabel($name, onEditEnd: { print("New name is *\(name)* ") } )
                   // Text(mcbDetails.areaName)
                        .foregroundStyle(.white)
                        .background(.green)
                        .font(.caption2)
                }.padding(.top,2)
                    .padding(.bottom,10)
                VStack {
                    Text("Ref No:")
                        .foregroundStyle(.gray)
                        .font(.system(size: 10))
                    Text(referenceNumber)
                        .foregroundStyle(.gray)
                        .font(.system(size: 8))
                        .fontWeight(.light)
                        .lineLimit(1)
                }.padding(.bottom, 10)
            }.frame(width: labelValues(rowLabel:referenceNumber))
                .background(.white)
                .onAppear(){
                    logo = mcbDetails.logo
                    applicationName = mcbDetails.name
                   name = mcbDetails.areaName
                    referenceNumber = mcbDetails.referenceNumber
                    
                }
    }
}

func labelValues(rowLabel:String) -> CGFloat{
    
    switch rowLabel {
    case "R9S06391": return 100
    case "R9S06291": return 80
    default: return 60
    }
}
