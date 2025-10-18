//
//  MenuResponse.swift
//  GastroPapas
//
//  Created by Никита Нагорный on 18.10.2025.
//

import Foundation

struct MenuResponse: Codable {
    let menuCategory: [MenuCategory]
    
    enum CodingKeys: String, CodingKey {
        case menuCategory = "menu_categories"
    }
}
