//
//  MemoryGame.swift
//  Memorize
//
//  Created by Gabriel Alonso Cabral on 23/08/22.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func chooseCard(card: Card){
        print("Card chosen: \(card)")
        let chosenIndex: Int = self.findCardIndexInArray(card: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func findCardIndexInArray(card: Card)->Int{
        var index:Int = 0
        
        for cardIndex in 0..<cards.count{
            if (card.id == cards[cardIndex].id) {
                index = cardIndex
            }
        }
        return index
    }
    
    init(numberOfPairOfCards: Int, cardContentFactory:(Int)->CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id:pairIndex*2, content: content))
            cards.append(Card(id:pairIndex*2+1, content: content))

        }
    }
    
    struct Card: Identifiable {
        var id: Int

        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
    }
}
