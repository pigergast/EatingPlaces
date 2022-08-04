/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Le Pham Ngoc Hieu
 ID: 38377375
 Created  date: 04/08/2022
 Last modified: 04/08/2022
 Acknowledgement: Apple's SwiftUI Essentials tutorial https://developer.apple.com/tutorials/swiftui
 */
import SwiftUI

//View where we show the IntroView for when the app first startup, and afterwards leads into RowList() after the user finishs with the IntroView
struct WelcomeView: View {
    @EnvironmentObject var modelData: ModelData
    @State var welcomeStatus: Bool = true
    var body: some View {
        ZStack{
            if welcomeStatus{
                IntroView(active: $welcomeStatus)
            }
            else {
                RowList().environmentObject(ModelData())
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()            .environmentObject(ModelData())
    }
}
