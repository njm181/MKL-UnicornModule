//
//  MarketItemMapper.swift
//  MKL-UnicornModule
//
//  Created by Nico Molina on 11/08/2024.
//

import Foundation
import MKL_NifflersModule

public struct MarketItemMapper {
    
    static func mapToDomain(dto: MarketItemDTO) -> MarketItem {
        return MarketItem(name: dto.name, category: dto.category)
    }

    static func mapToDTO(domain: MarketItem) -> MarketItemDTO {
        return MarketItemDTO(name: domain.name, category: domain.category)
    }
}
