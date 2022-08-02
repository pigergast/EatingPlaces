/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Le Pham Ngoc Hieu
 ID: 38377375
 Created  date: 18/07/2022
 Last modified: 22/07/2022
 Acknowledgement: Apple's SwiftUI Essentials tutorial https://developer.apple.com/tutorials/swiftui
 */
import SwiftUI
//Detailed view of the place that includes picture and a map showing its location, with text informations such as name, address, price point, and personal description.
struct DetailView: View {
    @EnvironmentObject var modelData: ModelData
    var place: Place
    var placeIndex: Int {
        modelData.places.firstIndex(where: { $0.id == place.id })!
    }
    
    
    var body: some View {
        //Scrollview so that if description is long, user can scroll down
        ScrollView {
            //Mapview showing where the place is and a marker to show it's specific location
            MapView(marker: IdentifiablePlace(lat: place.locationCoordinate.latitude, long: place.locationCoordinate.longitude) ,coordinate: place.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 350)
            
            //image of the place
            CircleImage(image: place.image)
                .offset(y: -100)
                .padding(.bottom, -110)
            
            //Text information
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.title)
                HStack {
                    Text(place.address)
                    Spacer()
                    Text(place.price)
                        .foregroundColor(Color.blue)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(place.name)")
                    .font(.title3)
                    .bold()
                
                Text(place.description)
                HStack {
                    Spacer()
                    StarButton(isStarred: $modelData.places[placeIndex].starred)
                    Spacer()
                }
            }
            .padding()
        }
        .navigationTitle(place.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        
        DetailView(place: modelData.places[11])
            .environmentObject(modelData)
    }
}
