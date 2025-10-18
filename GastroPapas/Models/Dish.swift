//
//  DishModel.swift
//  GastroPapas
//
//  Created by Никита Нагорный on 18.10.2025.
//

import Foundation

struct Dish: Codable {
    let id: Int
    let name: String
    let description: String
    let price: Int
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case imageURL = "image_url"
    }
}
