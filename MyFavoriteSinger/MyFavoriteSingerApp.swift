//
//  MyFavoriteSingerApp.swift
//  MyFavoriteSinger
//
//  Created by dimitri on 07/03/2024.
//

import SwiftUI
import SwiftData

@main
struct MyFavoriteSingerApp: App {
    var body: some Scene {
        WindowGroup {
            ListeSingerView()
                .modelContainer(for: Singer.self)
                .preferredColorScheme(.dark)
        }
    }
}
