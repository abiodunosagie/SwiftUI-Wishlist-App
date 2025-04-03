//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Abiodun Osagie on 03/04/2025.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
               
        }//: WINDOWGROUP
        .modelContainer(for: Wish.self)
    }
}
