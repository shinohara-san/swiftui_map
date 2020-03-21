import SwiftUI
import MapKit
import Foundation

struct ContentView: View {
    
    @State var searchPlace = ""
    @State var latitude = 0
    @State var longitude = 0

    var body: some View {
        ZStack{
            MapView(searchPlace: $searchPlace).edgesIgnoringSafeArea(.all)
            
            VStack{
                TextField("地名を入力", text: $searchPlace).textFieldStyle(RoundedBorderTextFieldStyle()).padding()

                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.searchPlace = "Fukuoka"
                    }) {
                        Image(systemName: "smiley").padding().foregroundColor(.white).background(Color.gray).cornerRadius(50)
                    }.padding()
                }
                
            }
                
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
