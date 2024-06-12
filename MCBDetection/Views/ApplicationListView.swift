


import SwiftUI

struct ApplicationListView: View {
    
    @ObservedObject var applicationViewModel = ApplicationViewModel()
    @Binding var isShowingApplication : Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isShowingApplication = false
                    //index = 0
                })
                {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.white)
                }.padding(.leading, 10)
                    .padding(.trailing, 40)
                    .padding()
                Text("Select Application")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Spacer()
            }.frame(width: UIScreen.main.bounds.width)
                .background(Color.green)
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
               
               // print("Button Tapped")
            }){
                Text("Select")
                    .foregroundColor(.white)
                    
            }.frame(width: UIScreen.main.bounds.width - 40, height: 50)
            .background(Color.green)
            .cornerRadius(5)
            Spacer()
        }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
    }
}

