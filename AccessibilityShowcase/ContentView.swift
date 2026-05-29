//
//  ContentView.swift
//  AccessibilityShowcase
//
//  Created by Saverna on 5/23/26.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showError = false

    var body: some View {
        VStack(spacing: 24) {

            // App Title
            // accessibilityAddTraits(.isHeader) tells VoiceOver
            // to announce this as a heading — like an H1 in HTML
            Text("Welcome Back")
                .font(.largeTitle)
                .bold()
                .accessibilityAddTraits(.isHeader)

            // Email Field
            // accessibilityLabel tells VoiceOver exactly what
            // to say — without it VoiceOver just says "text field"
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .accessibilityLabel("Email address")
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            // Password Field
            // SecureField automatically hides characters
            // VoiceOver announces it as a secure text field
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .accessibilityLabel("Password")

            // Login Button
            // accessibilityHint tells VoiceOver users what
            // will happen AFTER they tap — not what the button is
            Button(action: {
                if email.isEmpty || password.isEmpty {
                    showError = true

                    // Post an accessibility notification so VoiceOver
                    // immediately announces the error — without this,
                    // a blind user taps Log In and hears nothing
                    UIAccessibility.post(
                        notification: .announcement,
                        argument: "Error: Please enter your email and password"
                    )
                }
            }) {
                Text("Log In")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .accessibilityLabel("Log In")
            .accessibilityHint("Double tap to log in to your account")

            // Error Message
            // Starting with "Error:" means VoiceOver users
            // immediately know something went wrong.
            // The announcement above fires instantly on tap —
            // this label is the visible fallback for sighted users
            if showError {
                Text("Error: Please enter your email and password")
                    .foregroundColor(.red)
                    .accessibilityLabel("Error: Please enter your email and password")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

