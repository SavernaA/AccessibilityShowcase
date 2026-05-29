# AccessibilityShowcase

A SwiftUI iOS app with a full XCUITest suite,  built to demonstrate production-grade accessible iOS development and software engineering practices.


## The Problem

Accessibility is often treated as an afterthought in iOS development. Most apps ship without proper VoiceOver support, dynamic type scaling, or sufficient color contrast, leaving millions of users behind. At the same time, many portfolios lack real iOS test automation, relying instead on manual testing checklists.

This project solves both.

## The Solution

AccessibilityShowcase is a fully functional SwiftUI app that:
- Demonstrates iOS accessibility best practices across real UI components
- Pairs every accessible UI pattern with an XCUITest that validates it automatically
- Serves as a living reference for accessible iOS development and test automation


## Tech Stack

- Language: Swift 5.9+
- UI Framework: SwiftUI
- Test Framework: XCUITest
- Accessibility APIs: UIAccessibility, AXElement
- Target Platform: iOS 16+
- IDE: Xcode 15+


## Project Structure

The project follows standard Xcode conventions:

- AccessibilityShowcase/ — main app source including ContentView.swift
- AccessibilityShowcaseUITests/ — XCUITest UI test suite
- AccessibilityShowcaseTests/ — unit tests for validation logic
- README.md
