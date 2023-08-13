//
//  cardImage.swift
//  Love&War
//
//  Created by mac on 09/08/2023.
//

import SwiftUI

struct cardImage: View {
    let image: Image
    
    var body: some View {
        ZStack{
            image
                .resizable()
                .frame( width: 120, height: 120)
                .clipShape(Rectangle())
        }.background(Color.white.opacity(0.5))
    }
}

struct cardImage_Previews: PreviewProvider {
    static var previews: some View {
        cardImage(image: Image("Aasimar_Paladin"))
    }
}
