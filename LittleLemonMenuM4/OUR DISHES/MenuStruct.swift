//
//  MenuStruct.swift
//  LittleLemonMenuM4
//
//  Created by Walter Bernal Montero on 09/10/23.
//

import Foundation

/// Struct for decodification of JSON data
struct JSONMenu: Codable {
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
    var menu: [MenuItem]
}

/// Struct for decodification of JSON data
struct MenuItem: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case priceStr = "price"
    }
    var id = UUID()
    let title: String
    var price: Float {
        return Float(priceStr) ?? 0
    }
    let priceStr: String
    
    // It is found better to do the conversion of String to Float
    // here instead of doing it in Dish+CoreDataClass file.
    // This way, the main 3 properties are in match with @NSManaged public var of Dish.
}
