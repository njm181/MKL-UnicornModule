//
//  MarketRequirementDTO.swift
//  MKL-UnicornModule
//
//  Created by Nico Molina on 30/08/2024.
//

import Foundation

struct MarketRequirementDTO {
    public let marketItemDto: MarketItemDTO
    public let quantity: Int
    
    public init(marketItemDto: MarketItemDTO, quantity: Int) {
        self.marketItemDto = marketItemDto
        self.quantity = quantity
    }
}
