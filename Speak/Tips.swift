//
//  Tips.swift
//  Speak
//
//  Created by Wong Jun heng on 27/7/22.
//

import Foundation

struct Tip: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    
    static let allRaw = [
    "Social etiquette tip 1",
    "Social etiquette tip 2",
    "Social etiquette tip 3",
    "Social etiquette tip 4",
    ]
    
    static var all: [Tip] {
        return allRaw.enumerated().map { (n, tip) in
            Tip(title: tip)
        }
    }
    
    static var sample: [Tip] {
        return Array(all.shuffled().prefix(through: 1))
        }
    }
