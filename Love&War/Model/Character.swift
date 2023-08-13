//
//  Character.swift
//  Love&War
//
//  Created by mac on 09/08/2023.
//

import Foundation
import SwiftUI

struct Character: Identifiable, Codable{
    var id : Int
    var name : String
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    var color : String
    var backgroundName: String
    var background: Image {
        Image(backgroundName)
    }
    var selected : Bool
    var category: String
    var longdes: String
}

enum HandCard{
    case One, Two, Three, Four, Five, Six, Seven, Eight,Invalid
    
    init(_ cards: Stack){
        var returnType: Self = .Invalid
        
        if cards[0].category == "1"{
            returnType = .One
        }
        if cards[0].category == "2"{
            returnType = .Two
        }
        if cards[0].category == "3"{
            returnType = .Three
        }
        if cards[0].category == "4"{
            returnType = .Four
        }
        if cards[0].category == "5"{
            returnType = .Five
        }
        if cards[0].category == "6"{
            returnType = .Six
        }
        if cards[0].category == "7"{
            returnType = .Seven
        }
        if cards[0].category == "8"{
            returnType = .Eight
        }
        self = returnType
    }
    
}

typealias Stack = [Character]


struct Player: Identifiable {
    var cards = Stack()
    var playerisme = false
    var id = UUID()
    var activePlayer = false
    var playerName = ""
}



struct Deck {
    private var cards = Stack()
    
    mutating func createfulldeck(){
        for _ in characters{
            cards += characters
        }
    }    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    mutating func drawcard() -> Character{
        return cards.removeLast()
    }
    
    func cardsRemaining() -> Int{
        return cards.count
    }
}

struct LoveWar{
    private(set) var players: [Player]
    
    init(){
        let oponent = [
            Player(playerName: "Player 2"),
        ]
        
        players = oponent
        players.append(Player(playerisme: true, playerName:"You"))
        
        var deck = Deck()
        deck.createfulldeck()
        deck.shuffle()
        
        let randomStartingPlayerIndex = Int(arc4random()) % players.count
        
            for p in randomStartingPlayerIndex...randomStartingPlayerIndex + (players.count-1){
                let i = p % players.count
                
                let card = deck.drawcard()
                players[i].cards.append(card)
            }
    }
    
    mutating func select(_ card : Character, in player: Player){
        if let cardIndex = player.cards.firstIndex(where:{$0.id == card.id}){
            if let playerIndex = players.firstIndex(where: {$0.id == player.id}){
                players[playerIndex].cards[cardIndex].selected.toggle()
            }
        }
    }
    mutating func activatePlayer(_ player : Player){
        if let playerIndex = players.firstIndex(where: {$0.id == player.id}){
            players[playerIndex].activePlayer = true
        }
    }
    
    mutating func findStartingPlayer() -> Player{
        let firstplayer = players[1]
        return firstplayer
    }
    
}


