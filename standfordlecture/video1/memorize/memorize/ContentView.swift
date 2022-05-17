//
//  ContentView.swift
//  memorize
//
//  Created by Tunc Gonel on 2022-05-06.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚇","🚙","🚓","🏎","🚃","🚛","🚗","🚕","🛵","🚲","🚖","🚇","🛬","🛩"
                  ,"🚑","🚎","🚌","🚊","🚝","🛴","🏍","🛺"]
    
    @State var emojiCount = 6
    
    var body: some View {
        
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount],id: \.self, content:  { emoji in
                        
                        CardView(content: emoji,isFaceUp: true).aspectRatio(2/3,contentMode: .fit)
                    }
                    
                    )
                    
                   
                    
                    
                }.foregroundColor(.red)
                    
                
            }
            Spacer()
            HStack{
                remove
                Spacer()
                add
                
            }
            .padding(.horizontal)
            .font(.largeTitle)
           
        }
        
        .padding(.horizontal)
//
    }
    
    var remove: some View {
        Button{
            if emojiCount > 1{
                
                emojiCount -= 1
                
            }
        } label: {
            VStack{
                Image(systemName: "minus.circle")
            }
            
        }
        
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
                
            }
        } label: {
            VStack{
                Image(systemName: "plus.circle")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}


struct CardView: View {
    var content: String
   @State var isFaceUp: Bool
    
    var body: some View{
        ZStack{
            
            let shape = RoundedRectangle(cornerRadius: 20.0)
            
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            }else{
                RoundedRectangle(cornerRadius: 10.0).fill()
                
            }
            
            
        }
        .onTapGesture {
            
            isFaceUp = !isFaceUp
        }
    }
}
