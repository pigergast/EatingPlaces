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
import Combine


final class ModelData: ObservableObject {
    @Published var places: [Place] = load("places.json")

}
//Function to decode data from json file and put it into an array of Places


func load<T: Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            
    else {
        
        fatalError("Couldn't find \(filename) in main bundle.")
        
    }
    
    
    do {
        
        data = try Data(contentsOf: file)
        
    } catch {
        
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        
    }

    
    do {
        
        let decoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: data)
        
    } catch {
        
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        
    }
    
}
