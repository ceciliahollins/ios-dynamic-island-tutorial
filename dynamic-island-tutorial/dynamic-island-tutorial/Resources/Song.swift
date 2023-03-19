//
//  Song.swift
//  dynamic-island-tutorial
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import SwiftUI

struct Song: Codable, Hashable {
    var songTitle: String
    var artist: String
    var albumCover: String
    var songLength: String
}
