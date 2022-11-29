//
//  tipsManager.swift
//  Speak
//
//  Created by Wong Jun heng on 28/7/22.
//

import Foundation
import SwiftUI

class TipManager: ObservableObject {
    @Published var tips: [Tip] = [] {
        didSet {
            save()
        }
    }
    
    let sampleTips: [Tip] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "tips.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTips = try? propertyListEncoder.encode(tips)
        try? encodedTips?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalTips: [Tip]!
        
        if let retrievedTipData = try? Data(contentsOf: archiveURL),
           let decodedTips = try? propertyListDecoder.decode([Tip].self, from: retrievedTipData) {
            finalTips = decodedTips
        } else {
            finalTips = sampleTips
        }
        
        tips = finalTips
    }
}




