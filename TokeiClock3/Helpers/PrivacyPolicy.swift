//  Copyright © 2020 Krassimir Iankov. All rights reserved.

import SwiftUI

struct PrivacyPolicy: View {
    @State var viewSize: CGSize
    @Binding var backgroundIndicatorOpacity: Double
    
    var body: some View {
       ZStack{
           
           Text("Privacy policy")
               .foregroundColor(.white)
               .font(.subheadline)
               .opacity(0.7)
               .position(x: viewSize.width * 0.8, y: viewSize.height * 0.95)
               .opacity(self.backgroundIndicatorOpacity)

       }  .gesture(
       TapGesture()
           .onEnded{
               if let url = URL(string: "https://mixedmotionapps.wordpress.com/privacy-policy/") {
                   UIApplication.shared.open(url)
               }
       })
    }
}
