//
//  ChannelCrafterApp.swift
//  ChannelCrafter
//
//  Created by Taka on 2023/11/14.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth


struct ChannelListView: View {
    var body: some View {
        // ここにChannelListViewの内容を記述
        Text("Channel List View")
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    var handle: AuthStateDidChangeListenerHandle? // handle変数の宣言
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            // ...
        }
        
        return true
    }
}


@main
struct YourApp: App {
    // register app delegate for Firebase setup
#if DEBUG
    // プレビュー時はFirebaseの設定をスキップ
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ChannelListView() // ChannelListViewを表示
            }
        }
    }
#else
    // 本番時にFirebaseの設定を行う
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
#endif
}

