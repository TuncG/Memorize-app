//
//  memorizeApp.swift
//  memorize
//
//  Created by Tunc Gonel on 2022-05-06.
//

import SwiftUI

@main
struct memorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
