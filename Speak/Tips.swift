//
//  Tips.swift
//  Speak
//
//  Created by Wong Jun heng on 27/7/22.
//

import Foundation

struct Tip: Identifiable, Codable {
    var id = UUID()
    var title: String
    
    static let allRaw = [
    "Social etiquette tip 1",
    "Social etiquette tip 2",
    "Social etiquette tip 3",
    "Social etiquette tip 4",
    ]
}
