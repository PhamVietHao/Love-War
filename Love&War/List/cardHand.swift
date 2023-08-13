//
//  cardHand.swift
//  Love&War
//
//  Created by mac on 11/08/2023.
//

import SwiftUI

struct cardHand: View {
    @ObservedObject var lovewar = LoveWarGame()
    var body: some View {
            GeometryReader { geo in
                VStack {
                    ForEach(lovewar.players){ player in
                        if !player.playerisme{
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 200),spacing: -50)]){
                                ForEach(player.cards){ card in
                                    CardModel(character: card)
                                        .scaleEffect(0.6)
                                }
                            }
                            .frame(height: geo.size.height / 3 )
                        }
                    }
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .background(
                                Image("table")
                                    .resizable()
                            )
                        let playerCard = lovewar.players[1].cards.filter{
                            $0.selected == true
                        }
                        let cardType = "\(lovewar.evaluateCard(lovewar.players[1].cards))"
                        Text(cardType)
                            
                    }
                    let myPlayer = lovewar.players[1]
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 180),spacing: -50)]){
                        ForEach(myPlayer.cards){ card in
                            CardModel(character: card)
                                .offset(y:card.selected ? -30 : 0)
                                .onTapGesture {
                                    lovewar.select(card, in: myPlayer )
                                }
                                .scaleEffect(0.6)
                        }
                    }

                }.background(Color("GreenBG"))
                
//                Finding first player
//                    .onAppear(){
//                        print("On appear")
//                        let firstplayer = lovewar.findStartingPlayer()
//                        print(firstplayer.playerName)
//                    }
            }
 
    }
}

struct cardHand_Previews: PreviewProvider {
    static var previews: some View {
        cardHand()
    }
}
