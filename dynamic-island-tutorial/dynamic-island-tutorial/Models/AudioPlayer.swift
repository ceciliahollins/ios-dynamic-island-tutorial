//
//  AudioPlayer.swift
//  dynamic-island-tutorial
//
//  Created by Hollins, Cecilia on 22/10/2024.
//


import Foundation
import SwiftUI
import AVFoundation

@Observable
class AudioPlayer: NSObject, AVAudioPlayerDelegate {
    
    private var audioPlayer: AVAudioPlayer!
    
    var controlButtonIcon = Image(systemName: "play.fill")
    var isPlaying: Bool {
        audioPlayer.isPlaying
    }
    var songHasFinished: () -> () = { }
    
    func loadSong(_ fileName: String) {
        let path = Bundle.main.path(forResource: "\(fileName).mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.delegate = self
        } catch {
            print("couldn't load the file")
        }
    }
    
    func play() {
        controlButtonIcon = Image(systemName: "pause.fill")
        audioPlayer.play()
    }
    
    func pause() {
        controlButtonIcon = Image(systemName: "play.fill")
        audioPlayer.pause()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        songHasFinished()
    }
}
