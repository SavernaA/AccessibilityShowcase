# AccessibilityShowcase

## Who am I?
I'm Saverna, and I'm passionate about making technology
accessible to everyone. I built this project because I
believe every user deserves a great experience, including
people who rely on VoiceOver and other assistive technologies.
This is me learning by doing and proving it with real work.

## What is this project?
This is a SwiftUI iOS login screen that I built specifically
to test for accessibility issues. I chose a login screen
because it is one of the most commonly failed accessibility
audits in real iOS apps, if a user can't log in, they can't
use anything else.

## Why accessibility?
Accessibility is not an afterthought for me, it is the whole
point. I want to be the engineer who catches the bugs that
exclude people. The ones that make someone put their phone
down because an app just does not work for them.

## Decisions I made and why
- I added .accessibilityAddTraits(.isHeader) to the title
  because VoiceOver users need to know they are at the top
  of a new screen
- I added .accessibilityLabel to every input field because
  without it VoiceOver would just say "text field"; which
  tells the user nothing
- I added .accessibilityHint to the login button to guide
  VoiceOver users on what will happen when they tap it
- I labeled the error message with "Error:" at the start so
  a VoiceOver user immediately knows something went wrong
  without having to navigate to find out

## What I would test next
- Dynamic Type - does my layout break when a user sets their
  font size to the largest option?
- Color contrast - does my blue button actually meet WCAG AA
  contrast standards?
- Focus order — does VoiceOver move through the screen in a
  logical order that makes sense?
- Dark mode — do all my elements stay visible when the user
  switches to dark mode?
