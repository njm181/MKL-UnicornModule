//
//  DataSourceService.swift
//  MKL-UnicornModule
//
//  Created by Nico Molina on 12/08/2024.
//

import Foundation

protocol DataSourceService {
    func saveItem(marketItemDTO: MarketItemDTO) async throws -> Bool
    func fetchItems() async throws -> [MarketItemDTO]
}
