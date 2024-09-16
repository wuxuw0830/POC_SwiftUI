//
//  Item.swift
//  app
//
//  Created by Kelly on 2024/8/5.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
