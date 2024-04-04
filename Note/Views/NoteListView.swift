//
//  NoteListView.swift
//  Note
//
//  Created by Babypowder on 2/4/2567 BE.
//

import SwiftUI
import FirebaseFirestoreSwift

struct NoteListView: View {
    @StateObject var viewModel: NoteListViewModel
    
    @FirestoreQuery var items: [NoteItem]
    let userId: String
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: NoteListViewModel(userId: userId))
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    NavigationLink(destination: NoteDetailView(userId: userId, item: item)) {
                            NoteItemView(item: item)
                                .swipeActions {
                                    Button {
                                        viewModel.delete(id: item.id)
                                    } label: {
                                        Image(systemName: "trash.fill")
                                    }
                                    .tint(.red)
                                }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Note")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewNoteView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    NoteListView(userId: "qRSYEOoLBiSynBuqlwBVAxRNb7a2")
}
