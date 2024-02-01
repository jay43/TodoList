//
//  Home.swift
//  ToDoList
//
//  Created by Jay K on 31/01/24.
//

import SwiftUI
import SwiftData

struct Home: View {
    
    @Query(filter: #Predicate<Todo> { !$0.isCompleted },
           sort: [SortDescriptor(\Todo.lastUpdated, order: .reverse)],
           animation: .snappy)
    private var activeList: [Todo]
    
    @Environment(\.modelContext) private var context
    @State private var showAll: Bool = false
    
    var body: some View {
        List {
            Section(activeSessionTitle) {
                ForEach(activeList) {
                   TodoRowView(todo: $0)
                }
            }
            
            CompletedTodoList(showAll: $showAll)
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button(action: {
                    // Creating an empty TODO task
                    let todo = Todo(task: "", priority: .normal)
                    // saving into context
                    context.insert(todo)
                }) {
                    Image(systemName: "plus.circle.fill")
                        .fontWeight(.light)
                        .font(.system(size: 42))
                    
                }
            }
        }
    }
    
    var activeSessionTitle: String {
        let count = activeList.count
        return count == 0 ? "Active" : "Active \(count)"
    }
}

#Preview {
    ContentView()
}
