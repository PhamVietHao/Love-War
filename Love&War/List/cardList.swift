//
//  cardList.swift
//  Love&War
//
//  Created by mac on 09/08/2023.
//

import SwiftUI



struct cardList: View {
    
    var body: some View {
        ScrollView {
            VStack{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100),spacing:0)], spacing: 0){
                    ForEach(characters){ character in
                        CardModel(character: character)
                            .scaleEffect(0.6)
                    }.padding(.bottom, -100)
                        
                }
            }
        }
    }
}

struct cardList_Previews: PreviewProvider {
    static var previews: some View {
        cardList()
    }
}
