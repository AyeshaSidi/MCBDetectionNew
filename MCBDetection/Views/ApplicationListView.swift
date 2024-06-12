


import SwiftUI

struct ApplicationListView: View {
    
    @ObservedObject var applicationViewModel = ApplicationViewModel()
    
    var body: some View {
        VStack {
            List(applicationViewModel.applicationArray, id: \.id) { task in
                HStack {
                    Image(systemName: task.image)
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("\(task.applicationName)")
                        .font(.system(size: 14))
                        .foregroundColor(Color.black)
                }
                
            }
            Button(action: {
               
                print("Button Tapped")
            }){
                Text("Select")
                    .foregroundColor(.white)
                    
            }.frame(width: UIScreen.main.bounds.width - 40, height: 50)
            .background(Color.green)
            .cornerRadius(5)
            Spacer()
        }
        
    }
}

