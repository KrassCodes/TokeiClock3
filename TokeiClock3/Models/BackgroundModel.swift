//  Copyright © 2020 Krassimir Iankov. All rights reserved.


import SwiftUI

struct BackgroundModel: View {
    let color1: Color
    let color2: Color?
    let viewSize: CGSize
    
    var body: some View {
        Rectangle()
            .fill(makeBGGradient())
            .frame(width: viewSize.width, height: viewSize.height)
    }
    
    private func makeBGGradient () -> LinearGradient {
        if let color2 = color2 {
            return LinearGradient (gradient: Gradient(colors: [color1, color2]), startPoint: .top, endPoint: .bottom)
        } else {
            return LinearGradient (gradient: Gradient(colors: [color1, color1]), startPoint: .top, endPoint: .bottom)
        }
    }
    
    
}
