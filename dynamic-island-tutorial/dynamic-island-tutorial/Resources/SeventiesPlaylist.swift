//
//  SeventiesPlaylist.swift
//  dynamic-island-tutorial
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import SwiftUI

struct SeventiesPlaylist {
    var songs: [Song]
    
    init() {
        songs = [one, two, three, four, five]
    }
    
    let one = Song(songTitle: "Dreams", artist: "Fleetwood Mac", albumCover: "fleetwoodMac", songLength: "4:18")
    let two = Song(songTitle: "One of These Nights", artist: "Eagles", albumCover: "eagles", songLength: "4:52")
    let three = Song(songTitle: "Bennie and The Jets", artist: "Elton John", albumCover: "eltonJohn", songLength: "5:23")
    let four = Song(songTitle: "Dancing in the Moonlight", artist: "Toploader", albumCover: "toploader", songLength: "3:52")
    let five = Song(songTitle: "Vienna", artist: "Billy Joel", albumCover: "billyJoel", songLength: "3:34")
    
}
