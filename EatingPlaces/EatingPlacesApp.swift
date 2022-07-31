/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Le Pham Ngoc Hieu
  ID: Your student id (e.g. 1234567)
  Created  date: 18/07/2022
  Last modified: 18/07/2022
  Acknowledgement: Apple's SwiftUI Essentials tutorial https://developer.apple.com/tutorials/swiftui
*/

import SwiftUI

@main
struct EatingPlacesApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
