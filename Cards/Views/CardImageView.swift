//
//  CardImageView.swift
//  Cards
//
//  Created by Zach Evetts on 3/18/23.
//

import SwiftUI

struct CardImageView: View {
    
    var url : String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
                .scaledToFit()
                .frame(width: 500, height: 500)
        } placeholder: {
            ProgressView()
        }
        
    }
}

struct CardImageView_Previews: PreviewProvider {
    static var previews: some View {
        CardImageView(url: "https://images.ygoprodeck.com/images/cards/34541863.jpg")
    }
}
