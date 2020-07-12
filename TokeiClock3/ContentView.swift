//  Copyright © 2020 Krassimir Iankov. All rights reserved.


import SwiftUI

struct ContentView: View {

    @State var numberOpactity: Double = 1
    @State var backgroundOffset: CGFloat = 0
    @State var backgroundIndicatorOpacity: Double = 0
    @State var backgroundIndicatorOpacityTimer: Int = 0
    @State var kanjiTypeSelected: Bool = true

    
    var body: some View {
        GeometryReader{ g in
            ZStack{
                GeometryReader {scrollGeo in
                    
// BACKGROUNDS
                    Backgrounds(viewSize: g.size)
                        .offset(x: (scrollGeo.size.width * self.backgroundOffset) * -1 )
                        .animation(.default)
                }
            }
            
// NUMBERS
            TheNumbers(numberOpactity: self.$numberOpactity, kanjiTypeSelected: self.$kanjiTypeSelected, viewSize: g.size)
           
// CLOCK
            Clock(viewSize: g.size, backgroundIndicatorOpacityTimer: self.$backgroundIndicatorOpacityTimer, backgroundIndicatorOpacity: self.$backgroundIndicatorOpacity)
            
// BACKGROUND INDICATOR
            BackgroundIndicator(viewSize: g.size, backgroundOffset: self.$backgroundOffset, backgroundIndicatorOpacity: self.$backgroundIndicatorOpacity)

// PRIVACY POLICY
            PrivacyPolicy(viewSize: g.size, backgroundIndicatorOpacity: self.$backgroundIndicatorOpacity)
            
        }.edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
        .gesture(TokeiTap)
        .gesture(TokeiDrag)
    }
    
    
    
// GESTURES
    var TokeiTap: some Gesture {
        TapGesture()
        .onEnded{
                if self.kanjiTypeSelected {
                    withAnimation{self.numberOpactity = 0}
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.kanjiTypeSelected.toggle()
                            withAnimation{self.numberOpactity = 1}
                        }
                }else{
                     withAnimation{ self.numberOpactity = 0 }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.kanjiTypeSelected.toggle()
                            withAnimation{ self.numberOpactity = 1 }
                        }
                    }
        }
    }

    var TokeiDrag: some Gesture {
        DragGesture()
        .onEnded({ value in

            withAnimation{
                self.backgroundIndicatorOpacity = 1
                self.backgroundIndicatorOpacityTimer = 2
            }

            if value.translation.width > 10 {
                if self.backgroundOffset >= -3 {
                    self.backgroundOffset -= 1
                }
            } else if value.translation.width < -10 {
                if self.backgroundOffset <= 3 {
                    self.backgroundOffset += 1
                }
            }
        })
    }
    
    
    
    
    
}
