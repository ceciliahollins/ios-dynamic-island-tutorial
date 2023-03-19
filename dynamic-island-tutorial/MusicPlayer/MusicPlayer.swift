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
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), playlist: SeventiesPlaylist().songs)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, playlist: SeventiesPlaylist().songs)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, playlist: SeventiesPlaylist().songs)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let playlist: [Song]
}

struct MusicPlayerEntryView : View {
    var entry: Provider.Entry
    var currSong = 0

    var body: some View {
        ZStack {
            Color.black
            VStack {
                Image(entry.playlist[currSong].albumCover)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(entry.playlist[currSong].songTitle)
                    .font(.body)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text(entry.playlist[currSong].artist)
                    .font(.caption)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
            }
            .padding()
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

struct MusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), playlist: SeventiesPlaylist().songs))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
