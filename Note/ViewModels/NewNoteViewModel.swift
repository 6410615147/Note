//
//  NewNoteViewModel.swift
//  Note
//
//  Created by Babypowder on 2/4/2567 BE.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewNoteViewModel: ObservableObject {
    @Published var title = ""
    @Published var content = ""
    @Published var showAlert = false
    
    func save() {
        guard canSave else { return }
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newItem = NoteItem(
            id: newId,
            title: title,
            content: content,
            createDate: Date().timeIntervalSince1970
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
}
