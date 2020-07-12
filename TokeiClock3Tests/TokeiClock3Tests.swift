//  Copyright © 2020 Krassimir Iankov. All rights reserved.


import XCTest
@testable import TokeiClock3

class TokeiClock3Tests: XCTestCase {

    func testOffsetValueToCheck() {
        let testGradientIndex = 0
        
        let testGradientsCountOdd = 11 //if odd number of gradients
        XCTAssertEqual(offsetValueToCheck(gradientIndex: testGradientIndex, gradientsCount: testGradientsCountOdd), Double(-5))
        
        let testGradientsCountEven = 8 //if even number of gradients
        XCTAssertEqual(offsetValueToCheck(gradientIndex: testGradientIndex, gradientsCount: testGradientsCountEven), Double(-4))
        
        // Programattic testing
        for n in (0...20) {
            XCTAssertEqual(offsetValueToCheck(gradientIndex: testGradientIndex, gradientsCount: n), Double(Double(testGradientIndex) - floor(Double(n)/Double(2))))
        }
    }
}
