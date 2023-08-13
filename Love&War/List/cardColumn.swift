//
//  cardColumn.swift
//  Love&War
//
//  Created by mac on 09/08/2023.
//

import SwiftUI

struct cardColumn: View {
    
    var character : Character
    
    var body: some View {
        ZStack{
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 100, height: 150)
            VStack{
                cardBackground(background: character.background)
                    .background.resizable()
                    .frame(width: 100, height: 150)
            }.offset(y:1)
                

            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 11)
                        .frame(width: 80, height: 15)
                        .foregroundColor(Color(character.color))
                    
                    VStack{
                        Text(character.name)
                            .font(Font.system(size: 6))
                            .fontWeight(.bold)
                    }
                }.offset(y: -15)

                    .font(Font.system(size: 12))
                    .foregroundColor(.white)
                    .offset(y: -1)
                cardImage(image: character.image)
                    .image.resizable()
                    .frame(width: 50, height: 60)
                    .background(Color.white.opacity(0.8))
                    .offset(y: -5)
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 80, height: 20)
                        .foregroundColor(Color(character.color))
                    VStack{
                        Text(character.longdes)
                            .multilineTextAlignment(.center)
                            .font(Font.system(size: 5))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }.offset(y:10)
            }
        }
        .overlay(
            Rectangle()
                .stroke(Color(character.color), lineWidth: 4))
        
    }
}

struct cardColumn_Previews: PreviewProvider {
    static var previews: some View {
        cardColumn(character: characters[0])
    }
}
