//
//  NoteItem.swift
//  Note
//
//  Created by Babypowder on 2/4/2567 BE.
//

import Foundation

struct NoteItem: Codable, Identifiable {
    let id: String
    let title: String
    let content: String
    let createDate: TimeInterval
}
