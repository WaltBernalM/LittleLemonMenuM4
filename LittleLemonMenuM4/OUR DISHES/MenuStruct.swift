//
//  MenuStruct.swift
//  LittleLemonMenuM4
//
//  Created by Walter Bernal Montero on 09/10/23.
//

import Foundation

struct JSONMenu: Codable {
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
    var menu: [MenuItem]
}

struct MenuItem: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case priceStr = "price"
    }
    var id = UUID()
    let title: String
    let priceStr: String
    var price: Float {
        return Float(priceStr) ?? 0
    }
}
