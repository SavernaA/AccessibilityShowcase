//
//  AccessibilityShowcaseUITests.swift
//  AccessibilityShowcaseUITests
//
//  Created by Saverna on 5/24/26.
//

import XCTest

final class AccessibilityShowcaseUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Stop tests immediately if one fails
        continueAfterFailure = false
        // Launch the app before every test
        app.launch()
    }

    override func tearDownWithError() throws {
        // Nothing to clean up for now
    }

    // TEST 1
    // Does the login button actually exist on screen?
    // If this fails nothing else matters
    @MainActor
    func testLoginButtonExists() throws {
        let button = app.buttons["Log In"]
        XCTAssertTrue(button.exists, "Log In button should exist on screen")
    }

    // TEST 2
    // Does the login button have an accessibility label?
    // Without this VoiceOver just says "button" — useless
    @MainActor
    func testLoginButtonHasAccessibilityLabel() throws {
        let button = app.buttons["Log In"]
        XCTAssertTrue(button.exists, "Log In button should have an accessibility label")
        XCTAssertFalse(button.label.isEmpty, "Log In button label should not be empty")
    }

    // TEST 3
    // Does the email field have an accessibility label?
    // Without this VoiceOver just says "text field" — useless
    @MainActor
    func testEmailFieldHasAccessibilityLabel() throws {
        let emailField = app.textFields["Email address"]
        XCTAssertTrue(emailField.exists, "Email field should have accessibility label 'Email address'")
    }

    // TEST 4
    // Does the error message appear when fields are empty?
    // This is real user behavior — what happens when someone
    // tries to log in without filling anything in?
    @MainActor
    func testErrorMessageAppearsWhenFieldsEmpty() throws {
        let button = app.buttons["Log In"]
        button.tap()
        let error = app.staticTexts["Error: Please enter your email and password"]
        XCTAssertTrue(error.exists, "Error message should appear when fields are empty")
    }

    // TEST 5
    // Is the error message accessible to VoiceOver?
    // An error appearing visually means nothing if
    // VoiceOver does not announce it
    @MainActor
    func testErrorMessageHasAccessibilityLabel() throws {
        let button = app.buttons["Log In"]
        button.tap()
        let error = app.staticTexts["Error: Please enter your email and password"]
        XCTAssertTrue(error.exists, "Error message should be accessible to VoiceOver")
        XCTAssertFalse(error.label.isEmpty, "Error message label should not be empty")
    }
}
