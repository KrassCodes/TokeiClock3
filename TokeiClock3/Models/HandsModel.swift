//  Copyright © 2020 Krassimir Iankov. All rights reserved.

import SwiftUI

struct ClockHand: Shape {
    let inset: CGFloat
    let angle: Angle
    
    func path(in rect: CGRect) -> Path {
        let rect = rect.insetBy(dx: inset, dy: inset)
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: endPosition(for: CGFloat(angle.radians), in: rect))
        
        return path
    }
    
    private func endPosition(for angle: CGFloat, in rect: CGRect) -> CGPoint {
        let angle = angle - (.pi/2)
        let radius = min(rect.width, rect.height)/2
        let xPosition = rect.midX + (radius * cos(angle))
        let yPosition = rect.midY + (radius * sin(angle))
        return CGPoint(x: xPosition, y: yPosition)
    }
}
