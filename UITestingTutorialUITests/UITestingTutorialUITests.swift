//
//  UITestingTutorialUITests.swift
//  UITestingTutorialUITests
//
//  Created by Pradeep on 08/05/20.
//  Copyright © 2020 Code Pro. All rights reserved.
//

import XCTest

class UITestingTutorialUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidLoginSuccess()  {
        //XCUIApplication().navigationBars["Mockify Music"].buttons["Profile"].tap()
        
        let validUserName = "sagar"
        let validPassword = "1234"
        
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        let userTxtFld = app.textFields["Username"]
        XCTAssertTrue(userTxtFld.exists)
        
        userTxtFld.tap()
        userTxtFld.typeText(validUserName)
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let downloadRow = app.tables/*@START_MENU_TOKEN@*/.staticTexts["My Downloads"]/*[[".cells.staticTexts[\"My Downloads\"]",".staticTexts[\"My Downloads\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(downloadRow.exists)
                
    }

    func testInvalidLogin_AlertIsShownForMissingCredential()  {
        
        
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        app.textFields["Username"].tap()
        
        let fKey = app/*@START_MENU_TOKEN@*/.keys["f"]/*[[".keyboards.keys[\"f\"]",".keys[\"f\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        fKey.tap()
        fKey.tap()
        fKey.tap()
        fKey.tap()
        
        let app2 = app
        app2/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let alertDialog = app.alerts["Missing Credentials"]
        XCTAssertTrue(alertDialog.exists)
        alertDialog.buttons["Ok"].tap()
    }
   
    func testInvalidLogin_ProgressSpinnerIsHidden()  {
        
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Missing Credentials"].scrollViews.otherElements.buttons["Ok"].tap()
        let activityIndicator = app.activityIndicators["In progress"]
        XCTAssertFalse(activityIndicator.exists)
        
        
    }
}
