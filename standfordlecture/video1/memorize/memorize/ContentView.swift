//
//  ContentView.swift
//  memorize
//
//  Created by Tunc Gonel on 2022-05-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: true)
            
        }
        .padding(.horizontal).foregroundColor(.red)
//
    }
    
    func foo(){
        
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
   @State var isFaceUp: Bool
    
    var body: some View{
        ZStack{
            
            let shape = RoundedRectangle(cornerRadius: 20.0)
            
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text("🚅")
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
