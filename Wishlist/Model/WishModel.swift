//
//  WishModel.swift
//  Wishlist
//
//  Created by Abiodun Osagie on 03/04/2025.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
