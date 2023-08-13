//
//  cardBackground.swift
//  Love&War
//
//  Created by mac on 09/08/2023.
//

import SwiftUI

struct cardBackground: View {
    let background : Image
    var body: some View {
        ZStack{
            background
                .resizable()
                .frame( width: 200, height: 280)
                .clipShape(Rectangle())
        }
    }
}

struct cardBackground_Previews: PreviewProvider {
    static var previews: some View {
        cardBackground(background: Image("Leaf"))
    }
}
