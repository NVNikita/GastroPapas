//
//  MenuCategory.swift
//  GastroPapas
//
//  Created by Никита Нагорный on 18.10.2025.
//

import Foundation

struct MenuCategory: Codable {
    let id: Int
    let name: String
    let dishes: [Dish]
}
