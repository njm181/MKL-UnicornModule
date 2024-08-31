//
//  DataSourceService.swift
//  MKL-UnicornModule
//
//  Created by Nico Molina on 12/08/2024.
//

import Foundation
import MKL_NifflersModule

protocol DataSourceProtocol {
    func saveItem(collectionName: String, marketItemDTO: MarketItemDTO, quantity: Int) async throws -> DataResultResponse<Any>
    func fetchItems(collectionName: String) async throws -> DataResultResponse<Any>
}
