//
//  settingsManager.swift
//  Speak
//
//  Created by Wong Jun heng on 29/7/22.
//

import Foundation
import SwiftUI

class SettingManager: ObservableObject {
    @Published var settings: [Setting] = [] {
        didSet {
            save()
        }
    }
    
    let sampleSettings: [Setting] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "settings.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedSettings = try? propertyListEncoder.encode(settings)
        try? encodedSettings?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalSettings: [Setting]!
        
        if let retrievedSettingData = try? Data(contentsOf: archiveURL),
           let decodedSettings = try? propertyListDecoder.decode([Setting].self, from: retrievedSettingData) {
            finalSettings = decodedSettings
        } else {
            finalSettings = sampleSettings
        }
        
        settings = finalSettings
    }
}

