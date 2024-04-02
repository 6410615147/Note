//
//  NoteDetailView.swift
//  Note
//
//  Created by Babypowder on 2/4/2567 BE.
//

import SwiftUI

struct NoteDetailView: View {
    @StateObject var viewModel = NoteItemViewModel()
    let item: NoteItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title)
                    .bold()
                
                Text(item.content)
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
        }
    }
}

#Preview {
    NoteDetailView(item: NoteItem(id: "123", title: "Get Milk", content: "temp", createDate: Date().timeIntervalSince1970))
}
