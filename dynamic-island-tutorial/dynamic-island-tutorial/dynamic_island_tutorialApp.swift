//
//  dynamic_island_tutorialApp.swift
//  dynamic-island-tutorial
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import SwiftUI

@main
struct dynamic_island_tutorialApp: App {
    
    @State private var model = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
