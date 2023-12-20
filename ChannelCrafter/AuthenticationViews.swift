//
//  AuthenticationViews.swift
//  ChannelCrafter
//
//  Created by Taka on 2023/11/21.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("登録") {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        print("Error creating user: \(error.localizedDescription)")
                    } else {
                        print("User created successfully!")
                        // ユーザーが作成された後の処理
                    }
                }
            }
        }
        .padding()
    }
}

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Login") {
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        print("Error logging in: \(error.localizedDescription)")
                    } else {
                        print("Logged in successfully!")
                        // ログインが成功した後の処理
                    }
                }
            }
        }
        .padding()
    }
}
