//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Jay K on 31/01/24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Todo.self)
    }
}
