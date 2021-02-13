//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yurii Lampak on 30.01.2021.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        shuffleCards();
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chosenIndex = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        
    }
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id ==  card.id {
                return index
            }
        }
        return -1
    }
    
    mutating func shuffleCards() {
        cards.shuffle();
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
