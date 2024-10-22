//
//  MusicPlayer.swift
//  MusicPlayer
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), song: SeventiesPlaylist.songs[0])
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, song: SeventiesPlaylist.songs[0])
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, song: SeventiesPlaylist.songs[hourOffset])
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let song: Song
}

struct MusicPlayerEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Image(entry.song.albumCover)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            Text(entry.song.songTitle)
                .font(.headline)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
            Text(entry.song.artist)
                .font(.body)
                .foregroundStyle(.secondary)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
        }
        .containerBackground(for: .widget) {
            Color(red: 0.01, green: 0.29, blue: 0.41)
        }
    }
}

struct MusicPlayer: Widget {
    let kind: String = "MusicPlayer"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            MusicPlayerEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: WidgetFamily.systemLarge) {
    MusicPlayer()
} timeline: {
    SimpleEntry(date: Date.now, configuration: ConfigurationIntent(), song: SeventiesPlaylist.songs[0])
    SimpleEntry(date: Date.now, configuration: ConfigurationIntent(), song: SeventiesPlaylist.songs[1])
    SimpleEntry(date: Date.now, configuration: ConfigurationIntent(), song: SeventiesPlaylist.songs[2])
    SimpleEntry(date: Date.now, configuration: ConfigurationIntent(), song: SeventiesPlaylist.songs[3])
    SimpleEntry(date: Date.now, configuration: ConfigurationIntent(), song: SeventiesPlaylist.songs[4])
}
