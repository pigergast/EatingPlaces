/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Le Pham Ngoc Hieu
 ID: 38377375
 Created  date: 18/07/2022
 Last modified: 18/07/2022
 Acknowledgement: Apple's SwiftUI Essentials tutorial https://developer.apple.com/tutorials/swiftui
 */
import Foundation
import SwiftUI
import CoreLocation

//Struct to hold a place's informationj
struct Place: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var address: String
    var description: String
    var price: String
    var starred: Bool
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
}
