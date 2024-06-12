//
//  MCBCellView.swift
//  MCBModel
//
//  Created by Ayesha Siddiqua on 20/02/24.
//

import SwiftUI

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


func labelValues(rowLabel:String) -> CGFloat{
    
    switch rowLabel {
    case "R9S06391": return 70
    case "R9S06291": return 50
    default: return 35
        
    }
}
