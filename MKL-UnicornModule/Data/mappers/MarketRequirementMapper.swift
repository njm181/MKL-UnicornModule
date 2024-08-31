//
//  MarketRequirementMapper.swift
//  MKL-UnicornModule
//
//  Created by Nico Molina on 30/08/2024.
//

import Foundation
import MKL_NifflersModule

public struct MarketRequirementMapper {
    
    static func mapToDomain(dto: MarketRequirementDTO) -> MarketRequirement {
        return MarketRequirement(
            marketItem: MarketItem(
                name: dto.marketItemDto.name,
                category: dto.marketItemDto.category
            ),
            quantity: dto.quantity
        )
    }

    static func mapToDTO(domain: MarketRequirement) -> MarketRequirementDTO {
        return MarketRequirementDTO(
            marketItemDto: MarketItemDTO(
                name: domain.marketItem.name,
                category: domain.marketItem.category
            ),
            quantity: domain.quantity
        )
    }
}
