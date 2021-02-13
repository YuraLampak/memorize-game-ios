//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yurii Lampak on 30.01.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🦋", "🙈", "🐋", "🍉", "⚽️", "🐙"]
        let random = Int.random(in: 2...emojis.count)
        return MemoryGame<String>(numberOfPairsOfCards: random) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func chooseCard(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
