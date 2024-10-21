//
//  ViewModel.swift
//  dynamic-island-tutorial
//
//  Created by Hollins, Cecilia on 22/10/2024.
//
import SwiftUI
import Observation

@Observable
class ViewModel {
    var playlist: [Song] = SeventiesPlaylist.songs
    var currPlayingSong: Song = SeventiesPlaylist.songs[0]
    
    func currSongFinishedPlaying() {
        let curri = playlist.firstIndex(of: currPlayingSong) ?? 0
        let nexti = curri == playlist.count - 1 ? 0 : curri + 1
        currPlayingSong = SeventiesPlaylist.songs[nexti]
    }
}
