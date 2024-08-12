//
//  MarketItemDTO.swift
//  MKL-UnicornModule
//
//  Created by Nico Molina on 11/08/2024.
//

import Foundation

struct MarketItemDTO {
    public let name: String
    public let category: String
    
    public init(name: String, category: String) {
            self.name = name
            self.category = category
    }
}
