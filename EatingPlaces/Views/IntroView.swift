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


//Introduction view that users will see on startup
struct IntroView: View {
    
    @Binding var active: Bool
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(edges: .all)
            VStack{
                Spacer()
                Image(systemName: "fork.knife.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 150))
                
                Spacer()
                
                Text("Welcome to my App!").foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("This app contains my favorite places to eat out in HCMC. I hope you give some of them a try!").foregroundColor(.white)
                    .font(.title3).multilineTextAlignment(.center)
                
                Spacer()
                //Button to continue to main screen. Works by setting a @Binding var to false such that the view that this view is called in resets to the main view
                Button{
                    active = false
                }label: {
                    Capsule().foregroundColor(.white).frame(width: 250, height: 100)
                        .overlay(content: {
                            Image(systemName: "arrowtriangle.right.fill").foregroundColor(.blue)
                                .font(.system(size: 60))
                        })
                }
                Spacer()
                
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(active: .constant(true))
    }
}
