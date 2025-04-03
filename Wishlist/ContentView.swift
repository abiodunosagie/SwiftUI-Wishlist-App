//
//  ContentView.swift
//  Wishlist
//
//  Created by Abiodun Osagie on 03/04/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(wish)
                            }
                        }
                }
            }//: LIST
            .navigationTitle("My Christmas Wishlist")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                          
                    }
                }
                if wishes.isEmpty != true {
                    ToolbarItem(placement: .bottomBar) {
                        Text("You have \(wishes.count) wish\(wishes.count > 1 ? "es left" : "")")
                    }
                }
            }//: TOOLBAR
            .alert("Create a new wish", isPresented: $isAlertShowing) {
                TextField("Enter a wish", text: $title)
                Button {
                    modelContext.insert(Wish(title: title))
                    title = "" // This clears out the textfield after you save.
                } label: {
                    Text("Save")
                }
            }//: ALERT
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView(
                        "My Wishlist",
                        systemImage: "heart.circle",
                        description: Text("No wishes yet. Add one to get started.")
                    )//: CONTENTUNAVAILABLE
                }
            }//: OVERLAY
        }//: NAVIGATION STACK
    }
}
    
// MARK: - PREVIEWS

#Preview("List with sample Data") {
    let container = try! ModelContainer(
        for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(Wish(title: "Master SwiftData"))
    container.mainContext.insert(Wish(title: "Buy a new iPhone"))
    container.mainContext.insert(Wish(title: "Practice latin dances"))
    container.mainContext.insert(Wish(title: "Travel to Europe"))
    container.mainContext.insert(Wish(title: "Make a positive impact"))
    
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
