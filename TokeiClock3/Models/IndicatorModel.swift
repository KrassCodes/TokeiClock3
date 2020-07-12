//  Copyright © 2020 Krassimir Iankov. All rights reserved.


import SwiftUI

struct InidcatorModel: View {
    @Binding var backgroundOffset: CGFloat
    @State var backgroundOffsetValueToCheck: CGFloat
    @State var gradient: BGGradientModel
    let smallSize: CGFloat
    let largeSize: CGFloat
    
    var body: some View {
        Circle()
            .fill(makeBGGradient())
           .frame(width: self.backgroundOffset == backgroundOffsetValueToCheck ? largeSize : smallSize,
                  height: self.backgroundOffset == backgroundOffsetValueToCheck ? largeSize : smallSize)
           .overlay(
               Circle()
                   .stroke(Color.white, lineWidth: 3)
                   )
    }
    
    private func makeBGGradient () -> LinearGradient {
        if let color2 = gradient.color2 {
            return LinearGradient (gradient: Gradient(colors: [gradient.color1, color2]), startPoint: .top, endPoint: .bottom)
        } else {
            return LinearGradient (gradient: Gradient(colors: [gradient.color1, gradient.color1]), startPoint: .top, endPoint: .bottom)
        }
    }
    
}
