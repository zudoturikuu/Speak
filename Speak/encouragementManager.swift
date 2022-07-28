//
//  encouragementManager.swift
//  Speak
//
//  Created by Wong Jun heng on 28/7/22.
//

import Foundation
import SwiftUI

class EncouragementManager: ObservableObject {
    @Published var encouragements: [Encouragement] = [] {
        didSet {
            save()
        }
    }
    
    let sampleEncouragements: [Encouragement] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "encouragements.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedEncouragements = try? propertyListEncoder.encode(encouragements)
        try? encodedEncouragements?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalEncouragements: [Encouragement]!
        
        if let retrievedEncouragementData = try? Data(contentsOf: archiveURL),
           let decodedEncouragements = try? propertyListDecoder.decode([Encouragement].self, from: retrievedEncouragementData) {
            finalEncouragements = decodedEncouragements
        } else {
            finalEncouragements = sampleEncouragements
        }
        
        encouragements = finalEncouragements
    }
}

