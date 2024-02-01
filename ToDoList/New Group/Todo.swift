//
//  Todo.swift
//  ToDoList
//
//  Created by Jay K on 31/01/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Todo {
    private (set) var taskId: String = UUID().uuidString
    var task: String
    var isCompleted: Bool = false
    var priority: Priority = Priority.normal
    var lastUpdated: Date = Date.now
    
    init(task: String, priority: Priority) {
        self.task = task
        self.priority = priority
    }
}

enum Priority: String, Codable, CaseIterable {
    case normal = "Normal"
    case medium = "Medium"
    case high = "High"
    
    var color: Color {
        switch self {
        case .normal: return Color.green
        case .medium: return Color.yellow
        case .high: return Color.red
        }
    }
}
