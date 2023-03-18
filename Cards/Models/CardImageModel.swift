//
//  CardImageModel.swift
//  Cards
//
//  Created by Zach Evetts on 3/18/23.
//

import Foundation

struct CardImagesModel : Codable, Identifiable {
    let id = UUID()
    let image_url : String
}
