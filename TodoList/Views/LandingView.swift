//
//  LandingView.swift
//  TodoList
//
//  Created by Russell Gordon on 2024-04-08.
//

import SwiftUI

struct LandingView: View {
    
    // MARK: Stored properties
    
    // The item currently being added
    @State var newItemDescription = ""
    
    // The search text
    @State var searchText = ""
    
    // The view model
    @State var viewModel = TodoListViewModel()
    
    @State var presentingNewItemSheet = false
    
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            
            VStack {
                
                List($viewModel.todos) { $todo in
                    
                    ItemView(currentItem: $todo)
                    // Delete item
                        .swipeActions {
                            Button(
                                "Delete",
                                role: .destructive,
                                action: {
                                    viewModel.delete(todo)
                                }
                            )
                        }
                    
                }
                .searchable(text: $searchText)
                .onChange(of: searchText) {
                    Task {
                        try await viewModel.filterTodos(on: searchText)
                    }
                }
                
                HStack {
                    TextField("Enter a to-do item", text: $newItemDescription)
                    
                    Button("ADD") {
                        // Add the new to-do item
                        viewModel.createToDo(withTitle: newItemDescription)
                        newItemDescription = ""
                    }
                    .font(.caption)
                    .disabled(newItemDescription.trimmingCharacters(in: .whitespaces).isEmpty == true)
                }
                .padding(20)
                
            }
            .navigationTitle("To do")
            .sheet(isPresented: $presentingNewItemSheet) {
                NewItemView(showSheet: $presentingNewItemSheet)
                    .presentationDetents([.medium, .fraction(0.15)])
            }
            .toolbar {
                // Add a button to trigger showing the sheet
                ToolbarItem(placement: .automatic) {
                    Button {
                        presentingNewItemSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
        }
        .environment(viewModel)
    }
    
    
}

#Preview {
    LandingView()
}
