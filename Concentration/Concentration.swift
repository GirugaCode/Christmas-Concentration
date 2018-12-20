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
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        //TODO: Shuffle the cards
    }
}
