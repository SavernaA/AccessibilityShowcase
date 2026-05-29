---

## What's Tested

- VoiceOver labels — validates accessibilityLabel and accessibilityHint on interactive elements
- Error announcements — confirms VoiceOver announces errors immediately via UIAccessibility.post
- Field interaction — verifies fields accept typed input correctly
- Accessibility identifiers — validates testable IDs are set on all key UI elements
- Validation logic — unit tests covering email, password, and error state logic

---

## Running the Tests

```bash
git clone https://github.com/SavernaA/AccessibilityShowcase.git
cd AccessibilityShowcase
open AccessibilityShowcase.xcodeproj
```

Press Cmd+U in Xcode to run the full test suite.

---

## Why This Matters for Apple

Apple's Human Interface Guidelines treat accessibility as a first-class feature, not an add-on. This project reflects that philosophy by making accessibility validation part of the test suite — not a manual checklist.

---

## About

This project is part of a portfolio built to demonstrate production-level iOS development and software engineering skills — real code, real tests, real accessibility knowledge.

[GitHub Profile](https://github.com/SavernaA)
