//
//  BamBam_TrackingTests.swift
//  BamBam TrackingTests
//
//  Created by Wilbert Baker on 4/11/26.
//

import XCTest

final class ToDo_TaskUITest: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    // Start the name with the word 'test'
    // validateTaskCompletedTest -> Incorrect
    // testValidateTaskCompleted -> Correct
    
    func testLaunchEnglish() {
        app.launchArguments = ["-AppleLanguages", "(en)"]
        app.launch()
        
        // search for the accessibility ID of that text
        let header = app.staticTexts["Welcome_text_subtitle"]
        
        // verify that the text is shown in the correct language
        XCTAssertTrue(header.exists, "The text is not found in english")
    }
    
    func testLaunchDanish() {
        app.launchArguments = ["-AppleLanguages", "da"]
        app.launch()
        
        // search for the accessibility ID of that text
        let header = app.staticTexts["Welcome_text_subtitle"]
        
        // verify that the text is shown in correct language
        XCTAssertTrue(header.exists, "The text is not found in Danish")
    }
    func testLaunchJapanese() {
        app.launchArguments = ["-AppleLangguages", "(ja)"]
        app.launch()
        
        // search for the accessibility ID of that text
        let header = app.staticTexts["Welcome_text_subtitle"]
        
        // verify that the text is shown in the correct language
        XCTAssertTrue(header.exists, "The text is not found in Japanese")
        
    }
        
    
    }


