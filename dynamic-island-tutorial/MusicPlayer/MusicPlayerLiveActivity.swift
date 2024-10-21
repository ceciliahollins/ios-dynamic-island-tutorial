//
//  MusicPlayerLiveActivity.swift
//  MusicPlayer
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MusicPlayerAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var playlist: [Song]
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MusicPlayerLiveActivity: Widget {
    @State var currSong = 0
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MusicPlayerAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                MusicLockScreen(currSong: context.state.playlist[currSong])
            }
            .activityBackgroundTint(Color.black)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    MusicLeading(currSong: context.state.playlist[currSong])
                }
                DynamicIslandExpandedRegion(.trailing) {
                    MusicTrailing()
                }
                DynamicIslandExpandedRegion(.bottom) {
                    MusicBottom(currSong: context.state.playlist[currSong])
                }
            } compactLeading: {
                MusicCompactLeading(currSong: context.state.playlist[currSong])
            } compactTrailing: {
                MusicCompactTrailing()
            } minimal: {
                MusicMinimal(currSong: context.state.playlist[currSong])
            }
            .contentMargins(.leading, 25, for: .expanded)
            .contentMargins(.trailing, 25, for: .expanded)
            .contentMargins(.leading, 10, for: .compactLeading)
        }
    }
}

struct MusicPlayerLiveActivity_Previews: PreviewProvider {
    static let attributes = MusicPlayerAttributes(name: "Me")
    static let contentState = MusicPlayerAttributes.ContentState(playlist: SeventiesPlaylist.songs)

    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Lock Screen")
    }
}
