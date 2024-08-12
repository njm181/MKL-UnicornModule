//
//  FirestoreRepositoryImpl.swift
//  MKL-UnicornModule
//
//  Created by Nico Molina on 10/08/2024.
//

import Foundation
import MKL_NifflersModule

public class FirestoreRepositoryImpl: DataRepository {


    private let firestoreDataSource: DataSourceService
    
    init() {
        self.firestoreDataSource = FirestoreDataSourceImpl()
    }

    public func saveItem(marketItem: MarketItem) async throws -> Bool {
        let marketItemDTO = MarketItemMapper.mapToDTO(domain: marketItem)
        let result = try await firestoreDataSource.saveItem(marketItemDTO: marketItemDTO)
        print("Saving item from Firestore Repository Impl: \(result)")
        return true
    }
    
    public func fetchItems() async throws -> [MarketItem] {
        let result = try await firestoreDataSource.fetchItems()
        print("Fetching items from Firestore Repository Impl: \(result)")
        return result.map { MarketItemMapper.mapToDomain(dto: $0) }
    }
    
    
}
