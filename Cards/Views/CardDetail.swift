//
//  CardDetail.swift
//  Cards
//
//  Created by Zach Evetts on 3/18/23.
//

import SwiftUI

struct CardDetail: View {
    
    var card : CardModel

    var body: some View {

        ScrollView {
            VStack {
                ForEach(card.card_images) { image in
                    CardImageView(url: image.image_url)
                }
                .padding(.horizontal)
            }
        }
    }
}
