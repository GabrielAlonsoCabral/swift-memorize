//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Gabriel Alonso Cabral on 22/08/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel:EmojiMemoryGame = EmojiMemoryGame()
    
    var body: some View {
        return Grid(viewModel.cards){ card in
                CardView(card: card).onTapGesture(perform: {
                    viewModel.chooseCard(card: card)
                })
            }
        .foregroundColor(Color.orange)
        .padding()
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                if card.isFaceUp { CardWithFaceUp(card: card) }
                else { CardWithFaceDown() }
                
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height)*0.75))
        })
    }
    
}

struct CardWithFaceUp: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
        Text(card.content)
    }
}


struct CardWithFaceDown:View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        EmojiMemoryGameView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
