//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Gabriel Alonso Cabral on 23/08/22.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject{
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame()->MemoryGame<String>{
        let emojis:Array<String>=["👻","🎃","🕷"]

        return MemoryGame<String>(numberOfPairOfCards: emojis.count, cardContentFactory: { pairIndex in
            return emojis[pairIndex]
        })
    }
        
    // MARK: - Access to the Model
    
    var cards:Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    func chooseCard(card: MemoryGame<String>.Card){
        model.chooseCard(card: card)
    }
}
