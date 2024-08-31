//
//  MarketListMapper.swift
//  MKL-UnicornModule
//
//  Created by Nico Molina on 30/08/2024.
//

import Foundation
import MKL_NifflersModule

public struct MarketListMapper {
    
    static func mapToDomain(dto: MarketListDTO) -> MarketList {
        return MarketList(
            listOfItems: dto.listOfItemsDto.map({ marketRequirementDTO in
                MarketRequirementMapper.mapToDomain(dto: marketRequirementDTO)
            }),
            id: dto.id
        )
    }

    static func mapToDTO(domain: MarketList) -> MarketListDTO {
        return MarketListDTO(
            listOfItemsDto: domain.listOfItems.map({ marketRequirement in
                MarketRequirementMapper.mapToDTO(domain: marketRequirement)
            }),
            id: domain.id
        )
    }
    
    static func mapToMarketListDTO(from data: [String: Any]) -> MarketListDTO? {
        guard let id = data["id"] as? String,
              let listOfItemsArray = data["listOfItemsDto"] as? [[String: Any]] else {
            return nil
        }

        let listOfItemsDto = listOfItemsArray.compactMap { itemData -> MarketRequirementDTO? in
            guard let marketItemData = itemData["marketItemDto"] as? [String: Any],
                  let name = marketItemData["name"] as? String,
                  let category = marketItemData["category"] as? String,
                  let quantity = itemData["quantity"] as? Int else {
                return nil
            }
            
            let marketItemDto = MarketItemDTO(name: name, category: category)
            return MarketRequirementDTO(marketItemDto: marketItemDto, quantity: quantity)
        }
        
        return MarketListDTO(listOfItemsDto: listOfItemsDto, id: id)
    }
}
