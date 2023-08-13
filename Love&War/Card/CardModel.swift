//
//  CardModel.swift
//  Love&War
//
//  Created by mac on 09/08/2023.
//

import SwiftUI


struct CardModel: View{

    var character : Character
    
    var body: some View {
        ZStack{
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 200, height: 280)
            VStack{
                cardBackground(background: character.background)
            }.offset(y:1)
                

            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 11)
                        .frame(width: 160, height: 20)
                        .foregroundColor(Color(character.color))
                    VStack{
                        Circle()
                            .trim(from: 0.25, to: 0.75)
                            .foregroundColor(Color(character.color))
                            .frame(width: 70)
                            .offset(x:100,y: 40)
                        Text(character.category)
                            .font(Font.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .offset(x:90, y: -5)
                        Text(character.name)
                            .fontWeight(.bold)
                    }.offset(y: -40)
                }
                    .font(Font.system(size: 12))
                    .foregroundColor(.white)
                    .offset(y: -1)
                cardImage(image: character.image)
                    .offset(y: -30)
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 160, height: 50)
                        .foregroundColor(Color(character.color))
                    VStack{
                        Text(character.longdes)
                            .multilineTextAlignment(.center)
                            .font(Font.system(size: 11))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }.offset(y:-20)
            }
        }.overlay(
            Rectangle()
                .stroke(Color(character.color), lineWidth: 4))
        .frame(width: 200, height: 280)
        
        
    }
}

struct CardModel_Previews: PreviewProvider {
    static var previews: some View {
        CardModel(character: characters[0])
        CardModel(character: characters[1])
        CardModel(character: characters[2])
        CardModel(character: characters[4])
    }
}
