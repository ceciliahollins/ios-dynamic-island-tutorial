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
}
