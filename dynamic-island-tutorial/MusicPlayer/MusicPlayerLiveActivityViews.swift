//
//  MusicPlayerLiveActivityViews.swift
//  dynamic-island-tutorial
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import SwiftUI
import ActivityKit
import WidgetKit

// MARK: COMPACT

struct MusicCompactLeading: View {
    var currSong: Song
    
    var body: some View {
        Image(currSong.albumCover)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(5)
    }
}

struct MusicCompactTrailing: View {
    var body: some View {
        Image(systemName: "lines.measurement.horizontal")
    }
}

// MARK: MINIMAL

struct MusicMinimal: View {
    var currSong: Song
    
    var body: some View {
        Image(currSong.albumCover)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(5)
    }
}

// MARK: EXPANDED

struct MusicLeading: View {
    var currSong: Song
    
    var body: some View {
        HStack(alignment: .bottom) {
            Image(currSong.albumCover)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(currSong.songTitle)
                    .font(.body)
                    .foregroundColor(Color.white)
                Text(currSong.artist)
                    .font(.caption)
                    .foregroundColor(Color.white)
            }
            .fixedSize(horizontal: true, vertical: false)
        }
    }
}

struct MusicTrailing: View {
    var body: some View {
        Image(systemName: "lines.measurement.horizontal")
            .font(.title)
    }
}

struct MusicBottom: View {
    var currSong: Song
    
    var body: some View {
        VStack {
            HStack {
                Text("0:00")
                    .font(.caption)
                Rectangle()
                    .frame(width: .infinity, height: 2)
                Text(currSong.songLength)
                    .font(.caption)
            }
            .padding(.bottom)
            
            HStack {
                Spacer()
                Button { } label: {
                    Image(systemName: "backward.fill")
                        .foregroundColor(.white)
                }
                Spacer()
                Button { } label: {
                    Image(systemName: "pause.fill")
                        .foregroundColor(.white)
                }
                Spacer()
                Button { } label: {
                    Image(systemName: "forward.fill")
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
    }
}

// MARK: LOCK SCREEN

struct MusicLockScreen: View {
    var currSong: Song
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Image(currSong.albumCover)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                VStack(alignment: .leading) {
                    Text(currSong.songTitle)
                        .font(.body)
                        .foregroundColor(Color.white)
                    Text(currSong.artist)
                        .font(.caption)
                        .foregroundColor(Color.white)
                }
                Spacer()
            }

            VStack {
                HStack {
                    Text("0:00")
                        .font(.caption)
                        .foregroundColor(.white)
                    Rectangle()
                        .frame(width: .infinity, height: 2)
                        .foregroundColor(.white)
                    Text(currSong.songLength)
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .padding(.bottom)

                HStack {
                    Spacer()
                    Button { } label: {
                        Image(systemName: "backward.fill")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button { } label: {
                        Image(systemName: "pause.fill")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button { } label: {
                        Image(systemName: "forward.fill")
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
            }
        }
        .padding()
        .background(Color(red: 0.01, green: 0.29, blue: 0.41))
    }
}
