//
//  ViewController.swift
//  Concentration
//
//  Created by Ryan Nguyen on 12/18/18.
//  Copyright © 2018 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet { flipCountLabel.text = "Flips: \(flipCount)" }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            print("cardNumber = \(cardNumber)")
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.7601440549, green: 0.7730435729, blue: 0.4992948174, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
    }
    
    var emojiChoices = ["❄️","⛄️","🌟","⛷", "🥶", "🦌", "⛸", "🛷", "🎁", "🛍", "🛒"]

    func emoji(for card: Card) -> String {
        return "?"
    }

}

