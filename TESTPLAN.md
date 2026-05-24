# Test Plan — AccessibilityShowcase

## Why I wrote this test plan
I did not want to just build an app and call it done. I wanted
to prove it works for everyone. This is how I think through
testing as someone passionate about accessibility — who might
be left out and how do I make sure they are not.

## What I am testing and why I chose each case

### 1. Login button exists
I need to confirm the button is actually on the screen before
I test anything else. If this fails everything else is pointless.

### 2. Login button has an accessibility label
Without a label VoiceOver just says "button" — that tells a
user nothing. This test makes sure VoiceOver users know exactly
what this button does.

### 3. Email field has an accessibility label
Same reason — "text field" means nothing. "Email address text
field" tells the user exactly what to type.

### 4. Error message appears when fields are empty
This tests real user behavior. What happens when someone tries
to log in without filling anything in? The error must appear
and it must be readable by VoiceOver.

### 5. Error message has an accessibility label
An error appearing visually means nothing if VoiceOver does not
announce it. This test confirms the error is accessible, not
just visible.

## What I would add next
- Test that VoiceOver focus order moves top to bottom logically
- Test that the password field is announced as a secure field
- Test that Dynamic Type does not clip any text at larger sizes
- Test that all elements are reachable by keyboard navigation

## What I learned writing this plan
Writing a test plan forces you to think like a user, not a
developer. Every time I wrote "why I chose this test" I caught
something I had not thought about before. That is the whole
point of quality engineering.