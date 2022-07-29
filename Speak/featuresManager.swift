//
//  featuresManager.swift
//  Speak
//
//  Created by Wong Jun heng on 29/7/22.
//

import Foundation
import SwiftUI

class FeatureManager: ObservableObject {
    @Published var features: [Feature] = [] {
        didSet {
            save()
        }
    }
    
    let sampleFeatures: [Feature] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "features.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFeatures = try? propertyListEncoder.encode(features)
        try? encodedFeatures?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalFeatures: [Feature]!
        
        if let retrievedFeatureData = try? Data(contentsOf: archiveURL),
           let decodedFeatures = try? propertyListDecoder.decode([Feature].self, from: retrievedFeatureData) {
            finalFeatures = decodedFeatures
        } else {
            finalFeatures = sampleFeatures
        }
        
        features = finalFeatures
    }
}



