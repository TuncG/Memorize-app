//
//  EmojiMemoryGameView.swift
//  memorize
//
//  Created by Tunc Gonel on 2022-05-06.
//

import SwiftUI
let temp: () = print("hi!")

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    @State var emojiCount = 6
  
    var body: some View {
        
    
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(game.cards, content:  { card in
                        
                        CardView(card:card)
                            .aspectRatio(2/3,contentMode: .fit)
                            .onTapGesture {
                                
                                game.choose(card)
                                
                            }
                    }
                    
                    )
                    
                   
                    
                    
                }.foregroundColor(.red)
                    
                
            }
           
        
        .padding(.horizontal)
//
    }
    
  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let game  = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}


struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    
    var body: some View{
        GeometryReader(content: { geometry in
            ZStack{
                
                
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                
                if card.isFaceUp{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height) * DrawingConstants.fontScale))
                } else if card.isMatched{
                    shape.opacity(0)
                    
                }
                else{
                    shape.fill()
                    
                }
                
                
            }
        })
        
    }
    }
    
    private struct DrawingConstants{
        static let cornerRadius : CGFloat = 20
        static let lineWidth : CGFloat = 3
        static let fontScale : CGFloat = 0.8
    }
}
