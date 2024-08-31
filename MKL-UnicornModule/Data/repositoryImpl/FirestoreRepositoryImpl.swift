//
//  FirestoreRepositoryImpl.swift
//  MKL-UnicornModule
//
//  Created by Nico Molina on 10/08/2024.
//

import Foundation
import MKL_NifflersModule

public class FirestoreRepositoryImpl: DataRepository {
    
    private let firestoreDataSource: DataSourceProtocol
    
    public init() {
        self.firestoreDataSource = FirestoreDataSourceImpl()
    }
    
    public func storeItem(collectionName: String, marketRequirement: MarketRequirement) async throws -> DataResultResponse<Any> {
        let marketItemDTO = MarketItemMapper.mapToDTO(domain: marketRequirement.marketItem)
        let result = try await firestoreDataSource.saveItem(
            collectionName: collectionName,
            marketItemDTO: marketItemDTO,
            quantity: marketRequirement.quantity
        )
        print("Saving item from Firestore Repository Impl: \(result)")
        return result
    }
    
    public func fetchItems(collectionName: String) async throws -> DataResultResponse<Any> {
        var result = try await firestoreDataSource.fetchItems(collectionName: collectionName)
        print("Fetching items from Firestore Repository Impl: \(result)")
        //map to domain
        var itemList: MarketList? = nil
        if let marketListToDomain = result.data as? MarketListDTO {
            itemList = MarketListMapper.mapToDomain(dto: marketListToDomain)
        } else {
            print("Data is not of type MarketListDTO")

        }
        result.data = itemList
        return result
    }
    
}
