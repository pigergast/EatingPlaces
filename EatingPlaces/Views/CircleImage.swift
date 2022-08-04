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

// Image view that clips the image into a circle shape. Images are resized to fill the 250x250 frame
struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 5)
            }
            .shadow(radius: 5)
        
        
    }
    
}

struct CircleImage_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CircleImage(image: Image("bundau"))
        
    }
    
}
