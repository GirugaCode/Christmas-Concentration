//
//  Concentration.swift
//  Concentration
//
//  Created by Ryan Nguyen on 12/20/18.
//  Copyright © 2018 Danh Phu Nguyen. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var shuffleCards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchedIndex = indexOfOneAndOnlyFaceUpCard, matchedIndex != index {
                // Check if the cards matched
                if cards[matchedIndex].identifier == cards[index].identifier {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // Either no cards or two cards are faced up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        //TODO: Shuffle the cards
        
        for shuffle in 0..<cards.count {
            let random = Int(arc4random_uniform(UInt32(cards.count)))
            shuffleCards.append(cards[random])
            cards.remove(at: random)
            
            cards.append(shuffleCards[shuffle])
        }
    }
}
