//
//  PlayBackView.swift
//  Pitch Perfect
//
//  Created by KhuePM on 20/02/2024.
//

import SwiftUI

struct PlayBackView: View {
    @ObservedObject private var audiomanager = AudioManager()
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(action: {
                        self.audiomanager.playSound(rate: 0.5)
                    }, label: {
                        Image("Slow")
                            .contrast(audiomanager.isPlaying ? 0.3 : 1.0)
                    })
                    .disabled(audiomanager.isPlaying)
                   
                    Spacer()
                    Button(action: {
                        self.audiomanager.playSound(rate: 2.0)
                    }, label: {
                        Image("Fast")
                            .contrast(audiomanager.isPlaying ? 0.3 : 1.0)
                    })
                    .disabled(audiomanager.isPlaying)
                }
                .padding()
                
                HStack {
                    Button(action: {
                        self.audiomanager.playSound(rate: 1000)
                    }, label: {
                        Image("HighPitch")
                            .contrast(audiomanager.isPlaying ? 0.3 : 1.0)
                    })
                    .disabled(audiomanager.isPlaying)
                    
                    Spacer()
                    Button(action: {
                        self.audiomanager.playSound(rate: -1000)
                    }, label: {
                        Image("LowPitch")
                            .contrast(audiomanager.isPlaying ? 0.3 : 1.0)
                    })
                    .disabled(audiomanager.isPlaying)
                    
                }
                .padding()
                
                HStack {
                    Button(action: {
                        self.audiomanager.playSound(echo: true)
                    }, label: {
                        Image("Echo")
                            .contrast(audiomanager.isPlaying ? 0.3 : 1.0)
                    })
                    .disabled(audiomanager.isPlaying)
                    
                    Spacer()
                    Button(action: {
                        self.audiomanager.playSound(reverb: true)
                    }, label: {
                        Image("Reverb")
                            .contrast(audiomanager.isPlaying ? 0.3 : 1.0)
                    })
                    .disabled(audiomanager.isPlaying)
                    
                }
                .padding()
                
                Button(action: {
                    self.audiomanager.stopAudio()
                }, label: {
                    Image("Stop")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .contrast(audiomanager.isPlaying ? 1.0 : 0.3)
                })
                .disabled(!audiomanager.isPlaying)
            }
            .padding()
        }
    }
}

#Preview {
    PlayBackView()
}
