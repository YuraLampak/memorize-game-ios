//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Yurii Lampak on 30.01.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
