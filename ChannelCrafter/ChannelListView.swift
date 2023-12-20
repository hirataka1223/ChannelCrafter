//
//  ContentView.swift
//  ChannelCrafter
//
//  Created by Taka on 2023/11/14.
//

import SwiftUI

struct ContentView: View {
    var channels: [String] // チャンネルリストのデータモデル（例）
    
    var body: some View {
        NavigationView {
            List(channels, id: \.self) { channel in
                NavigationLink(destination: ChannelDetailView(channel: channel)) {
                    Text(channel)
                }
            }
            .navigationTitle("Channels")
        }
    }
}

struct ChannelDetailView: View {
    var channel: String // チャンネルデータの詳細（例）
    
    var body: some View {
        VStack {
            Text("Channel Detail: \(channel)")
                .font(.title)
                .padding()
            // ここに詳細表示のコンポーネントを追加
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(channels: ["Channel 1", "Channel 2"]) // チャンネルデータを渡す
    }
}

