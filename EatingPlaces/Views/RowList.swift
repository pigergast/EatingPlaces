/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Le Pham Ngoc Hieu
 ID: 38377375
 Created  date: 20/07/2022
 Last modified: 20/07/2022
 Acknowledgement: Apple's SwiftUI Essentials tutorial https://developer.apple.com/tutorials/swiftui
 */
import SwiftUI

//Row list that lists all the avaiable places to view. Clicking onto a row navigates to the detailed view of that place.
struct RowList: View {
    @State private var showFavoritesOnly = false
    @EnvironmentObject var modelData: ModelData
    
    var filteredPlaces: [Place] {
        modelData.places.filter { place in
            (!showFavoritesOnly || place.starred)
        }
    }
    var body: some View {
        NavigationView{
            List {
                //Button to toggle whether or not only favorited places are shown
                Toggle(isOn: $showFavoritesOnly) {
                    
                    Text("Favorites only")
                    
                }
                
                ForEach(filteredPlaces) { place in
                    
                    NavigationLink {
                        
                        DetailView(place: place)
                        
                    } label: {
                        
                        Row(place: place)
                        
                    }
                    
                }
                
            }
            .navigationTitle("🍴Places to eat out")
        }
    }
}

struct RowList_Previews: PreviewProvider {
    static var previews: some View {
        RowList().environmentObject(ModelData())
    }
}
