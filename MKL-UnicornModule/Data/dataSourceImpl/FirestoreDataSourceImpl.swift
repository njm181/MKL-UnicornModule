//
//  FirebaseDataSource.swift
//  MKL-UnicornModule
//
//  Created by Nico Molina on 12/08/2024.
//

import Foundation

class FirestoreDataSourceImpl : DataSourceService {
    
    func saveItem(marketItemDTO: MarketItemDTO) async throws -> Bool {
        print("Save item in Firebase")
        return true
    }
    
    func fetchItems() async throws -> [MarketItemDTO] {
        print("Get items from Firebase")
        
        return [
            MarketItemDTO(name: "Mock 1", category: "Mock 1"),
            MarketItemDTO(name: "Mock 2", category: "Mock 2"),
            MarketItemDTO(name: "Mock 3", category: "Mock 3"),
            MarketItemDTO(name: "Mock 4", category: "Mock 4")
        ]
    }
    
    
}
