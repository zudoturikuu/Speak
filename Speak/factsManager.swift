//
//  factsManager.swift
//  Speak
//
//  Created by Wong Jun heng on 28/7/22.
//

import Foundation
import SwiftUI

class FactManager: ObservableObject {
    @Published var facts: [Fact] = [] {
        didSet {
            save()
        }
    }
    
    let sampleFacts: [Fact] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "facts.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFacts = try? propertyListEncoder.encode(facts)
        try? encodedFacts?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalFacts: [Fact]!
        
        if let retrievedFactData = try? Data(contentsOf: archiveURL),
           let decodedFacts = try? propertyListDecoder.decode([Fact].self, from: retrievedFactData) {
            finalFacts = decodedFacts
        } else {
            finalFacts = sampleFacts
        }
        
        facts = finalFacts
    }
}

