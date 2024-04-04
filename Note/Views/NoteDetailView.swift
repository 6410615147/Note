//
//  NoteDetailView.swift
//  Note
//
//  Created by Babypowder on 2/4/2567 BE.
//

import SwiftUI
import FirebaseFirestoreSwift

struct NoteDetailView: View {
    @StateObject var viewModel: NoteDetailViewModel
    let item: NoteItem
    
    init(userId: String, item: NoteItem) {
        self.item = item
        self._viewModel = StateObject(wrappedValue: NoteDetailViewModel(userId: userId))
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Text(item.content)
                    .font(.title3)
                    .foregroundColor(Color(.secondaryLabel))
                Spacer()
            }
        }
        .navigationTitle(item.title)
        .toolbar {
            Button {
                viewModel.showingNewItemView = true
            } label: {
                Image(systemName: "pencil")
            }
        }
        .padding()
        .sheet(isPresented: $viewModel.showingNewItemView) {
            NewNoteView(newItemPresented: $viewModel.showingNewItemView, doNote: "Edit", item: item)
        }
            
        Spacer()
    }
}

#Preview {
    NoteDetailView(userId: "qRSYEOoLBiSynBuqlwBVAxRNb7a2", item: NoteItem(id: "123", title: "Get Milk", content: "temp", createDate: Date().timeIntervalSince1970))
}
