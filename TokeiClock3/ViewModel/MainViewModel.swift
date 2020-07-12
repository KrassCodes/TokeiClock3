//  Copyright © 2020 Krassimir Iankov. All rights reserved.

import SwiftUI

struct TheNumbers: View {
    @ObservedObject var numbersData = MarkerNumbersData()
    @Binding var numberOpactity: Double
    @Binding var kanjiTypeSelected: Bool
    @State var viewSize: CGSize

    var body: some View {
        ZStack{
            ForEach(0..<12, id: \.self) {n in
                self.showMarker(num: n)
            }
        }.frame(width: min(viewSize.width * 0.9, viewSize.height * 0.9), height: min(viewSize.width * 0.9, viewSize.height * 0.9))
        .position(x: viewSize.width / 2, y: viewSize.height / 2)
    }

    
    func showMarker (num: Int) -> some View {
         VStack {
            Text("\(self.kanjiTypeSelected ? self.numbersData.kanjiNumbers[num] : self.numbersData.arabicNumbers[num])")
                .fontWeight(.thin)
                .opacity(self.numberOpactity)
                .foregroundColor(Color.white)
                .font(.headline)
                .rotationEffect(Angle.degrees(Double(num)/(12) * -360))
             Spacer()
         }.rotationEffect(Angle.degrees(Double(num)/(12) * 360))
    }
}



struct Backgrounds: View {
    @ObservedObject var backgroundColors = BGColorsData()
    @State var viewSize: CGSize
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(backgroundColors.BGGradients, id: \.self) {bg in
                BackgroundModel(color1: bg.color1, color2: bg.color2, viewSize: CGSize(width: self.viewSize.width, height: self.viewSize.height))
            }
        }
    }
}



struct Clock: View {
    @State var viewSize: CGSize
    @Binding var backgroundIndicatorOpacityTimer: Int
    @Binding var backgroundIndicatorOpacity: Double
    
    @State private var hour: Int = 12
    @State private var minute: Int = 12
    @State private var second: Int = 12
    
    
    var body: some View {
        ZStack{
            ClockHand(inset: (min (viewSize.width * 0.3, viewSize.height * 0.3) ), angle: .degrees(Double(360/12 * self.hour)))
                .stroke(lineWidth: 6)
                .foregroundColor(.white)
            ClockHand(inset: (min (viewSize.width * 0.2, viewSize.height * 0.2) ), angle: .degrees(Double(360/60 * self.minute)))
                .stroke(lineWidth: 2)
                .foregroundColor(.white)
            Circle()
                .fill(Color.white)
                .frame(width:12)
            Circle()
                .fill(Color.red)
                .frame(width:8)
            ClockHand(inset: (min (viewSize.width * 0.1, viewSize.height * 0.1) ), angle: .degrees(Double(360/60 * self.second)))
                .stroke(lineWidth: 1)
                .foregroundColor(.red)
        }
        .onAppear{
            self.setTime();
            UIApplication.shared.isIdleTimerDisabled = true
        }
    }
    
    
    func setTime() {
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                let date = Date()
                let calendar = Calendar.current
                let hour = calendar.component(.hour, from: date)
                let minute = calendar.component(.minute, from: date)
                let second = calendar.component(.second, from: date)
                self.hour = hour
                self.minute = minute
                self.second = second
                        
            if self.backgroundIndicatorOpacityTimer > 0 {
                self.backgroundIndicatorOpacityTimer -= 1
            } else if self.backgroundIndicatorOpacityTimer == 0 {
                self.backgroundIndicatorOpacity = 0
            }

            
        }
    }
    
}



struct BackgroundIndicator: View {
    @ObservedObject var backgroundColors = BGColorsData()
    @State var viewSize: CGSize
    @Binding var backgroundOffset: CGFloat
    @Binding var backgroundIndicatorOpacity: Double
    var smallIndicator: CGFloat = 20
    var largeIndicator: CGFloat = 40
    
    var body: some View {
        
    ZStack{
        ZStack{
            Rectangle()
                .fill(Color.white.opacity(0.3))
                .frame(width:300, height:100)
                .cornerRadius(10)
                .position(x:viewSize.width / 2, y:viewSize.height / 2 )
          
            HStack{
                ForEach(0...backgroundColors.BGGradients.count - 1, id: \.self) {n in
                    InidcatorModel(backgroundOffset: self.$backgroundOffset,
                                   backgroundOffsetValueToCheck: CGFloat(offsetValueToCheck(gradientIndex: n, gradientsCount: self.backgroundColors.BGGradients.count)),
                                   gradient: self.backgroundColors.BGGradients[n],
                                   smallSize: self.smallIndicator,
                                   largeSize: self.largeIndicator)
                }
                }.animation(.default)
            }
        }.opacity(self.backgroundIndicatorOpacity)
    }
}


func offsetValueToCheck(gradientIndex: Int, gradientsCount: Int) -> Double {
    let halfOfTheGradientsCount = floor(Double(gradientsCount) / Double(2))
    return Double(gradientIndex) - halfOfTheGradientsCount
}
