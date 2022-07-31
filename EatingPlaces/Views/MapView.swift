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

import MapKit

//Struct required for map marker
struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}

//Mapview that takes in a coordinate and display it, along with a map marker on the map

struct MapView: View {
    let marker: IdentifiablePlace
    var coordinate: CLLocationCoordinate2D
    
    @State private var region =  MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [marker]){
            marker in MapMarker(coordinate: marker.location, tint: .red)
        }
        .onAppear {
            setRegion(coordinate)
        }
    }
    
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    }
    
}


struct MapView_Previews: PreviewProvider {
    
    static var previews: some View {
        MapView(marker: IdentifiablePlace(lat: 34.011_286, long: -116.166_868), coordinate:  CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868));
    }
    
}
