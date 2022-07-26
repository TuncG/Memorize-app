//
//  EmojiMemoryGame.swift
//  memorize
//  View Model file
//  Created by Tunc Gonel on 2022-05-19.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
   private static let emojis = ["🚇","🚙","🚓","🏎","🚃","🚛","🚗","🚕","🛵","🚲","🚖","🚇","🛬","🛩"
                  ,"🚑","🚎","🚌","🚊","🚝","🛴","🏍","🛺"]
    
   private static func createMemoryGame() -> MemoryGame<String> {
       MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in emojis[pairIndex]}
    }
    @Published private var model =  createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        
        return model.cards
    }
    
    func shuffle(){
        model.shuffle()
        
    }
    
    func choose(_ card: MemoryGame<String>.Card){
       
        model.choose(card)
        
    }
    
}
