//
//  NoteListViewModel.swift
//  Note
//
//  Created by Babypowder on 2/4/2567 BE.
//

import Foundation
import FirebaseFirestore

class NoteListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
