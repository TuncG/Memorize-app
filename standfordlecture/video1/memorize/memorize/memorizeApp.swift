//
//  memorizeApp.swift
//  memorize
//
//  Created by Tunc Gonel on 2022-05-06.
//

import SwiftUI

@main
struct memorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
