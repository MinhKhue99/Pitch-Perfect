//
//  ContentView.swift
//  Pitch Perfect
//
//  Created by KhuePM on 20/02/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var audiomanager = AudioManager()
    var body: some View {
        NavigationStack {
            VStack {
                Button(action: {
                    self.audiomanager.startRecording()
                }, label: {
                    Image("Record")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .contrast(audiomanager.isRecording ? 0.3 : 1.0)
                })
                .disabled(audiomanager.isRecording)
                
                Text(audiomanager.isRecording ? "Recording in progress" : "Tap to record")
                
                
                Button(action: {
                    self.audiomanager.stopRecording()
                }, label: {
                    NavigationLink(destination: PlayBackView()) {
                        Image(audiomanager.isRecording ? "Stop" : "Record")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .contrast(audiomanager.isRecording ? 1.0 : 0.3)
                    }
                })
                .disabled(!audiomanager.isRecording)
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
