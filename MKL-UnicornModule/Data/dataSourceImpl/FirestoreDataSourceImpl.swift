//
//  FirebaseDataSource.swift
//  MKL-UnicornModule
//
//  Created by Nico Molina on 12/08/2024.
//

import Foundation
import MKL_NifflersModule

class FirestoreDataSourceImpl : DataSourceProtocol {
    
    func saveItem(collectionName: String, marketItemDTO: MarketItemDTO, quantity: Int) async throws -> DataResultResponse<Any> {
        do {
            let ref = try await FirestoreConfig().db.collection(collectionName).addDocument(data: [
            "market_item_name": marketItemDTO.name,
            "market_item_category": marketItemDTO.category,
            "quantity": quantity
          ])
            print("Document added with ID: \(ref.documentID)")
            return DataResultResponse(data: ref.documentID, status: .SUCCESS, message: "Document stored correctly")
        } catch {
            print("Error adding document: \(error)")
            return DataResultResponse(data: error, status: .FAILURE, message: error.localizedDescription)
        }
    }
    
    func fetchItems(collectionName: String) async throws -> DataResultResponse<Any> {
        do {
            //var marketList: [String: Any] = ["": ""]
            var marketListDTOs: [MarketListDTO] = []
            
            let snapshot = try await FirestoreConfig().db.collection(collectionName).getDocuments()
            for document in snapshot.documents {
                print("\(document.documentID) => \(document.data())")
                
                // Mapea los datos del documento al objeto MarketListDTO
                if let marketListDTO = MarketListMapper.mapToMarketListDTO(from: document.data()) {
                    marketListDTOs.append(marketListDTO)
                }
                
                //marketList = document.data()
          }
            //return DataResultResponse(data: marketList, status: .SUCCESS, message: "Document got correctly")
            return DataResultResponse(data: marketListDTOs, status: .SUCCESS, message: "Document got correctly")
        } catch {
            print("Error getting documents: \(error)")
            return DataResultResponse(data: error, status: .FAILURE, message: error.localizedDescription)
        }
    }
    
    
}
