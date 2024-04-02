//
//  NoteApp.swift
//  Note
//
//  Created by Babypowder on 2/4/2567 BE.
//

import SwiftUI
import FirebaseCore

@main
struct NoteApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
