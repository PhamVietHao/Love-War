//
//  LoveWarGame.swift
//  Love&War
//
//  Created by mac on 12/08/2023.
//

import Foundation

class LoveWarGame: ObservableObject {
    @Published private var model = LoveWar()
    
    var players: [Player]{
        return model.players
    }
    
    func select(_ card: Character, in player: Player){
        model.select(card, in: player)
    }
    
    func evaluateCard(_ cards: Stack) -> HandCard{
        return HandCard(cards)
    }
    
    func findStartingPlayer() -> Player{
        return model.findStartingPlayer()
    }
}
