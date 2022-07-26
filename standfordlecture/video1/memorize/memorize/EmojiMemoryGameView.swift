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
        VStack{
            gameBody
            shuffle
        }
        .padding()

           
        
        
    }
    @State private var dealt = Set<Int>()
    
    private func deal(_ card: EmojiMemoryGame.Card){
        dealt.insert(card.id)
    }
    
    private func isUnDealt(_ card : EmojiMemoryGame.Card) -> Bool{
        return !dealt.contains(card.id)
        
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3 , content: {card in
            if isUnDealt(card) || card.isMatched && !card.isFaceUp{
                Color.clear
            }
            else {
                CardView(card:card)
                    .transition(AnyTransition.scale)
                    .onTapGesture {
                        withAnimation{
                            game.choose(card)
                        }
                        
                        
                    }
                
            }
        
        }).onAppear{
            withAnimation{
                
                for card in game.cards{
                    deal(card)
                }
            }
        }
            .foregroundColor(.red)
    }
    
    var deckBody : some View {
        ZStack{
            ForEach(game.cards.filter(isUnDealt)){ card in
                CardView(card: card)
            }
        }
    }
    
    var shuffle : some View {
        
        Button("shuffle"){
            withAnimation{
                game.shuffle()
            }
            
        }
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
                
                
                
                
               
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                        .padding().opacity(0.5)
                    Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 1))
                   // .font(Font.system(size: DrawingConstants.fontSize))
                    //.scaleEffect(scale(thatFits: geometry.size))
                       .font(Font.system(size: min(geometry.size.width, geometry.size.height) * DrawingConstants.fontScale))
                
                
                
            }.cardify(isFaceUp: card.isFaceUp)
            
        })
        
    }
    }
    
    private func scale (thatFits size:CGSize) -> CGFloat{
        min(size.width, size.height) / ( DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants{
        
        static let fontSize : CGFloat = 32
        
        static let fontScale : CGFloat = 0.7
    }
}
