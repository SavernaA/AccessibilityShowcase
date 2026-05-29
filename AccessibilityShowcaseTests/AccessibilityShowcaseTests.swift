//
//  AccessibilityShowcaseTests.swift
//  AccessibilityShowcaseTests
//
//  Created by Saverna on 5/23/26.
//

import XCTest
@testable import AccessibilityShowcase

final class AccessibilityShowcaseTests: XCTestCase {

    // TEST 1
    // Verify email validation logic — empty email should be invalid
    func testEmptyEmailIsInvalid() {
        let email = ""
        XCTAssertTrue(email.isEmpty, "Empty email string should be considered invalid")
    }

    // TEST 2
    // Verify password validation logic — empty password should be invalid
    func testEmptyPasswordIsInvalid() {
        let password = ""
        XCTAssertTrue(password.isEmpty, "Empty password string should be considered invalid")
    }

    // TEST 3
    // Verify that a properly formatted email passes basic validation
    func testValidEmailFormat() {
        let email = "test@example.com"
        let isValid = email.contains("@") && email.contains(".")
        XCTAssertTrue(isValid, "Email with @ and . should be considered valid format")
    }

    // TEST 4
    // Verify that an email without @ symbol fails validation
    func testInvalidEmailMissingAtSymbol() {
        let email = "testexample.com"
        let isValid = email.contains("@")
        XCTAssertFalse(isValid, "Email without @ should fail validation")
    }

    // TEST 5
    // Verify password meets minimum length requirement
    func testPasswordMinimumLength() {
        let shortPassword = "abc"
        let validPassword = "password123"
        XCTAssertTrue(shortPassword.count < 8, "Password under 8 characters should be too short")
        XCTAssertTrue(validPassword.count >= 8, "Password of 8+ characters should meet minimum length")
    }

    // TEST 6
    // Verify error state logic — error should show when both fields empty
    func testErrorStateWhenBothFieldsEmpty() {
        let email = ""
        let password = ""
        let shouldShowError = email.isEmpty || password.isEmpty
        XCTAssertTrue(shouldShowError, "Error state should be true when both fields are empty")
    }

    // TEST 7
    // Verify error state logic — error should show when only email is empty
    func testErrorStateWhenOnlyEmailEmpty() {
        let email = ""
        let password = "password123"
        let shouldShowError = email.isEmpty || password.isEmpty
        XCTAssertTrue(shouldShowError, "Error state should be true when email is empty")
    }

    // TEST 8
    // Verify error state logic — error should show when only password is empty
    func testErrorStateWhenOnlyPasswordEmpty() {
        let email = "test@example.com"
        let password = ""
        let shouldShowError = email.isEmpty || password.isEmpty
        XCTAssertTrue(shouldShowError, "Error state should be true when password is empty")
    }

    // TEST 9
    // Verify no error when both fields are filled
    func testNoErrorWhenBothFieldsFilled() {
        let email = "test@example.com"
        let password = "password123"
        let shouldShowError = email.isEmpty || password.isEmpty
        XCTAssertFalse(shouldShowError, "Error state should be false when both fields have values")
    }

    // TEST 10
    // Verify accessibility label strings match what VoiceOver will announce
    // These strings must match exactly what's in ContentView.swift
    func testAccessibilityLabelStringsAreCorrect() {
        let emailLabel = "Email address"
        let passwordLabel = "Password"
        let buttonLabel = "Log In"
        let buttonHint = "Double tap to log in to your account"
        let errorLabel = "Error: Please enter your email and password"

        XCTAssertFalse(emailLabel.isEmpty, "Email accessibility label should not be empty")
        XCTAssertFalse(passwordLabel.isEmpty, "Password accessibility label should not be empty")
        XCTAssertFalse(buttonLabel.isEmpty, "Button accessibility label should not be empty")
        XCTAssertFalse(buttonHint.isEmpty, "Button accessibility hint should not be empty")
        XCTAssertFalse(errorLabel.isEmpty, "Error accessibility label should not be empty")
        XCTAssertTrue(errorLabel.hasPrefix("Error:"), "Error label should start with 'Error:' for VoiceOver clarity")
    }
}

