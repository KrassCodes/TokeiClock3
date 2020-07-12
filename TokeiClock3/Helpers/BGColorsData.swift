//  Copyright © 2020 Krassimir Iankov. All rights reserved.

import SwiftUI

public class BGColorsData: ObservableObject {
    @Published var BGGradients: [BGGradientModel]
    
    init() {
        self.BGGradients = [
            BGGradientModel(color1: .black,     color2: nil),
            BGGradientModel(color1: .green,     color2: nil),
            BGGradientModel(color1: .blue,      color2: nil),
            BGGradientModel(color1: .orange,    color2: nil),
            BGGradientModel(color1: .purple,    color2: nil),
            BGGradientModel(color1: .pink1,     color2: .pink2),
            BGGradientModel(color1: .sexyBlue1, color2: .sexyBlue2),
            BGGradientModel(color1: .lush1,     color2: .lush2),
            BGGradientModel(color1: .frost1,    color2: .frost2)
        ]
    }
}
