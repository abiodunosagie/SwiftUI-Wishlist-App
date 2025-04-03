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
    
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                }
            }//: LIST
            .navigationTitle("WishList")
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView(
                        "My Wishlist",
                        systemImage: "heart.circle",
                        description: Text("No wishes yet. Add one to get started.")
                    )
                }
            }
        }
    }
}
    
// MARK: - PREVIEW
#Preview {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
