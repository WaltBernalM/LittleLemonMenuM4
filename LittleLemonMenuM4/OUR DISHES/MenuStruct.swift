//
//  MenuStruct.swift
//  LittleLemonMenuM4
//
//  Created by Walter Bernal Montero on 09/10/23.
//

import Foundation

struct JSONMenu: Codable {
    // Add code here
}

struct MenuItem: Codable, Identifiable {
    let id = UUID()
    let title: String
    let price: Int
}
