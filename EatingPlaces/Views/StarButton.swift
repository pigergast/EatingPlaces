/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Le Pham Ngoc Hieu
 ID: 38377375
 Created  date: 27/07/2022
 Last modified: 27/07/2022
 Acknowledgement: Apple's SwiftUI Essentials tutorial
 */


import SwiftUI

//Button that lets the user favorite or unfavorite a place, dependings on the place's existing favorite status
struct StarButton: View {
    @Binding var isStarred: Bool
    var body: some View {
        Button{
            isStarred.toggle()
        }label: {
            Capsule().frame(width: 250, height: 50)
                .overlay{
                    Text(isStarred ? "Unfavorite this place" : "Favorite this place").foregroundColor(.white)
                }
        }
    }
}

struct StarButton_Previews: PreviewProvider {
    static var previews: some View {
        StarButton(isStarred: .constant(true))
    }
}
