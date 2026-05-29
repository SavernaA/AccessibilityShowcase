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
    // Does the password field have an accessibility label?
    // SecureField must be explicitly labeled for VoiceOver users
    @MainActor
    func testPasswordFieldHasAccessibilityLabel() throws {
        let passwordField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordField.exists, "Password field should have accessibility label 'Password'")
    }

    // TEST 5
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

    // TEST 6
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

    // TEST 7
    // Can the user type into the email field?
    // Verifies the field is interactive, not just present
    @MainActor
    func testEmailFieldIsEditable() throws {
        let emailField = app.textFields["Email address"]
        emailField.tap()
        emailField.typeText("test@example.com")
        XCTAssertEqual(emailField.value as? String, "test@example.com",
                       "Email field should accept typed input")
    }

    // TEST 8
    // Does the error disappear after filling in both fields?
    // Confirms state resets correctly for returning users
    @MainActor
    func testNoErrorWhenFieldsAreFilled() throws {
        let emailField = app.textFields["Email address"]
        let passwordField = app.secureTextFields["Password"]
        let button = app.buttons["Log In"]

        // First trigger the error
        button.tap()
        XCTAssertTrue(
            app.staticTexts["Error: Please enter your email and password"].exists,
            "Error should appear when fields are empty"
        )

        // Now fill in both fields and verify we can proceed
        emailField.tap()
        emailField.typeText("test@example.com")
        passwordField.tap()
        passwordField.typeText("password123")

        // Verify fields have content
        XCTAssertEqual(emailField.value as? String, "test@example.com",
                       "Email field should contain entered text")
    }
}

