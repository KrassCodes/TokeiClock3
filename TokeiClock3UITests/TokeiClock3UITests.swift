//  Copyright © 2020 Krassimir Iankov. All rights reserved.

import XCTest

class TokeiClock3UITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testScreenInteraction() throws {
        let app = XCUIApplication()
        app.launch()
        let element = XCUIApplication().children(matching: .window).element(boundBy: 1).children(matching: .other).element
        XCTAssertTrue(element.exists)
    }
    
    func testPrivacyPolicy() throws {
        let app = XCUIApplication()
        app.launch()
        app.children(matching: .window).element(boundBy: 1).children(matching: .other).element.swipeLeft()
        
        let privacyPolicyButton = app.staticTexts["Privacy policy"]
        XCTAssertTrue(privacyPolicyButton.exists)
    }
}
