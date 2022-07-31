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

//Row view for use in Row list. Shows image and name of location
struct Row: View {
    var place: Place
    var body: some View {
        HStack{
            place.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(place.name)
            Spacer()
            
            //If ia place is favorited, then there will be a full star, if not, then a hollow star
            if place.starred{
                Image(systemName: "star.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 30))
            }
            else{
                Image(systemName: "star")
                    .foregroundColor(.blue)
                    .font(.system(size: 30))
            }
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var placesPreview = ModelData().places
    static var previews: some View {
        Group {
            Row(place: placesPreview[0])
        }
        .previewLayout(.fixed(width: 300, height: 50))
    }
}
