//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by junxi Yim on 2024/4/18.
//
//Database Password:Green5674!@#$%^&*()

//url
//https://tfvvjwlbjmujaftqssoj.supabase.co

//API Key
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRmdnZqd2xiam11amFmdHFzc29qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM0NjQxMjYsImV4cCI6MjAyOTA0MDEyNn0.NoOLBg7SBsuQrnpqZyAcSzf_fND8fp7qg9nq7Ehf0Zs


import Foundation

@Observable
class TodoListViewModel {
    
    // MARK: Stored properties
    // The list of to-do items
    var todos: [TodoItem]
    
    // MARK: Initializer(s)
    init(todos: [TodoItem] = []) {
        self.todos = todos
        Task {
                   try await getTodos()
               }

    }
    
    // MARK: Functions
    func getTodos() async throws {
        
        do {
            let results: [TodoItem] = try await supabase
                .from("todos")
                .select()
                .execute()
                .value
            
            self.todos = results
            
        } catch {
            debugPrint(error)
        }
        
    }
    
    func createToDo(withTitle title: String) {
        
        // Create the new to-do item instance
        let todo = TodoItem(
            title: title,
            done: false
        )
        
        // Append to the array
        todos.append(todo)
        
    }
    
    func delete(_ todo: TodoItem) {
        
        // Remove the provided to-do item from the array
        todos.removeAll { currentItem in
            currentItem.id == todo.id
        }
        
    }
    
}
