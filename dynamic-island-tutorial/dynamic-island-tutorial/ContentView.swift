//
//  ContentView.swift
//  dynamic-island-tutorial
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ViewModel.self) private var model
    @State private var audioPlayer: AudioPlayer = AudioPlayer()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                playlistHeader
                songRow
            }
        }
        .padding()
        .background(Color(red: 0.01, green: 0.29, blue: 0.41))
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    currPlayingSong
                    playPauseButton
                }
            }
        }
    }
    
    var playlistHeader: some View {
        VStack(alignment: .leading) {
            Image("playlistHeader")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            
            Text("Your Playlist")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(Color.white)
            
            Text("Play a song and see your song on the Dynamic Island")
                .font(.headline)
                .foregroundStyle(.secondary)
                .foregroundStyle(Color.white)
        }
    }
    
    var songRow: some View {
        @Bindable var model = model
        return VStack(spacing: 20) {
            ForEach(model.playlist, id: \.songTitle) { song in
                Button(action: {
                    playNewSelectedSong(song)
                }, label: {
                    HStack {
                        Image(song.albumCover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                        
                        VStack(alignment: .leading) {
                            Text(song.songTitle)
                                .font(.headline)
                                .foregroundStyle(Color.white)
                                .multilineTextAlignment(.leading)
                            Text(song.artist)
                                .font(.body)
                                .foregroundStyle(.secondary)
                                .foregroundStyle(Color.white)
                                .multilineTextAlignment(.leading)
                        }
                        
                        Spacer(minLength: 12)
                        
                        
                        Text(song.songLength)
                            .font(.body)
                            .foregroundStyle(Color.white)
                    }
                })
                .padding()
                .background(Color.white.opacity(0.2))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            }
        }
    }
    
    var currPlayingSong: some View {
        @Bindable var model = model
        
        return HStack {
            Image(model.currPlayingSong.albumCover)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
            
            VStack(alignment: .leading) {
                Text(model.currPlayingSong.songTitle)
                    .font(.headline)
                    .foregroundStyle(Color(red: 0.01, green: 0.29, blue: 0.41))
                    .multilineTextAlignment(.leading)
                Text(model.currPlayingSong.artist)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .foregroundStyle(Color(red: 0.01, green: 0.29, blue: 0.41))
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
    }
    
    var playPauseButton: some View {
        @Bindable var audioPlayer = audioPlayer
        
        return Button(action: {
            if audioPlayer.isPlaying {
                audioPlayer.pause()
            } else {
                audioPlayer.play()
            }
        }, label: {
            audioPlayer.controlButtonIcon
                .foregroundStyle(Color(red: 0.01, green: 0.29, blue: 0.41))
                .font(.largeTitle)
        })
    }
    
    func playNewSelectedSong(_ song: Song) {
        @Bindable var model = model
        @Bindable var audioPlayer = audioPlayer
        model.currPlayingSong = song
        audioPlayer.loadSong(song.audioFileName)
        audioPlayer.play()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(ViewModel())
    }
}
