//
//  NoteDetailViewModel.swift
//  Note
//
//  Created by Babypowder on 2/4/2567 BE.
//

import Foundation

class NoteDetailViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
}
