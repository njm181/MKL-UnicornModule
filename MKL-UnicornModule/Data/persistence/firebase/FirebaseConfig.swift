//
//  FirebaseConfig.swift
//  MKL-UnicornModule
//
//  Created by Nico Molina on 10/08/2024.
//

import FirebaseCore
import FirebaseFirestore

struct FirestoreConfig {
    public let db: Firestore

    init() {
        FirebaseApp.configure()
        db = Firestore.firestore()
    }
}
