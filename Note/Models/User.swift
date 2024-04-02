//
//  User.swift
//  Note
//
//  Created by Babypowder on 2/4/2567 BE.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
