//
//  NoteItemView.swift
//  Note
//
//  Created by Babypowder on 2/4/2567 BE.
//

import SwiftUI

struct NoteItemView: View {
    @StateObject var viewModel = NoteItemViewModel()
    let item: NoteItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title)
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: item.createDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
        }
    }
}

#Preview {
    NoteItemView(item: NoteItem(id: "123", title: "Get Milk", content: "temp", createDate: Date().timeIntervalSince1970))
}
