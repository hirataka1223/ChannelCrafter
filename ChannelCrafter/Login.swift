//
//  Login.swift
//  ChannelCrafter
//
//  Created by Taka on 2023/12/13.
//

import SwiftUI
import FirebaseAuth
import Firebase


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

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
