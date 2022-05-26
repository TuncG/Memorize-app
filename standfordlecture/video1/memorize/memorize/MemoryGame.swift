//
//  MemoryGame.swift
//  memorize
//  Model file 
//  Created by Tunc Gonel on 2022-05-19.
//

import Foundation


struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
   mutating func choose(_ card: Card){
        let chosenIndex =  index(of: card)
        
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int{
        for index in 0..<cards.count {
            if cards[index].id == card.id{
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content =  createCardContent(pairIndex)
            cards.append(Card( content: content, id: pairIndex * 2))
            cards.append(Card(content: content,id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}
