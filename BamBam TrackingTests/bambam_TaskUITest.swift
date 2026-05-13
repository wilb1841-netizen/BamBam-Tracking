//
//  bambam_TaskUITest.swift
//  BamBam Tracking
//
//  Created by Wilbert Baker on 4/27/26.
//

import XCTest

final class ToDo_TaskUITestsLaunchTests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    // Start the name with the word 'test'
    // ValidateTaskCompletedTest -> Incorrect
    // testValidateTaskCompleted -> Correct
    
    func testLaunchEnglish() {
        app.launchArguments = ["-AppleLaunguages", "(en)"]
        app.launch()
        
        ////search for the accesibility ID of that text
        let header = app.staticTexts["Welcome_text_subtitle"]
        
        // verify that the text is shown in the correct language
        XCTAssertTrue(header.exists, "The text is not found in English")
        
    }
    
    func testLaunchDanish() {
        app.launchArguments = ["-AppleLaunges", "(nl)"]
        app.launch()
        // search for the accesibility ID of that text
        let header = app.staticTexts["Welcome_text_subtitle"]
        
        //verify that the text is shown in the correct language
        XCTAssertTrue(header.exists, "The text is not found in Danish")
    }
    
    func testLaunchJapanese() {
        app.launchArguments = ["-AppleLanguages", "(ja)"]
        app.launch()
        
        // search for the accesibility ID of that text
        let header = app.staticTexts["Welcome_text_subtitle"]
        
        // verify that that the text is shown in the correct language
        XCTAssertTrue(header.exists, "The text is not found in Japanese")
    }
    
    //Create a new task within a group
    func testCreateNewTask() {
        let app = XCUIApplication()
        app.launch()
        
        //select profile
        let selectedProfile = app.buttons["Profile_Professor"]
        XCTAssertTrue(selectedProfile.exists)
        selectedProfile.tap()
        
        //create a new group
        let addGroup = app.buttons["AddGroupButton"]
        XCTAssertTrue(addGroup.exists)
        addGroup.tap()
        
        let nameField = app.textFields["GroupNameTextField"]
        nameField.tap()
        nameField.typeText("Test Task 123")
        
        app.buttons["SaveGroup"].tap()
    }
    
    
    
    
    
    
}
