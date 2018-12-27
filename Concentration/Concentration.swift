//
//  Concentration.swift
//  Concentration
//
//  Created by Ryan Nguyen on 12/20/18.
//  Copyright © 2018 Danh Phu Nguyen. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    var shuffleCards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chosesCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchedIndex = indexOfOneAndOnlyFaceUpCard, matchedIndex != index {
                // Check if the cards matched
                if cards[matchedIndex].identifier == cards[index].identifier {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                // Either no cards or two cards are faced up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
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

