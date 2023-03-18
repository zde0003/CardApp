//
//  CardModel.swift
//  Cards
//
//  Created by Zach Evetts on 3/18/23.
//

import Foundation

struct CardResults : Codable {
    let data : [CardModel]
}

struct CardModel : Codable, Identifiable {
    let id = UUID()
    let name : String
    let type : String
    let card_images : [CardImagesModel]
}
