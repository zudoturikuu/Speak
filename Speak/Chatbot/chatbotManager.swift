//
//  chatbotManager.swift
//  Speak
//
//  Created by Wong Jun heng on 29/7/22.
//

import Foundation
import SwiftUI

class ChatbotManager: ObservableObject {
    @Published var chatbots: [Chatbot] = [] {
        didSet {
            save()
        }
    }
    
    let sampleChatbots: [Chatbot] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "chatbots.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedChatbots = try? propertyListEncoder.encode(chatbots)
        try? encodedChatbots?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalChatbots: [Chatbot]!
        
        if let retrievedChatbotData = try? Data(contentsOf: archiveURL),
           let decodedChatbots = try? propertyListDecoder.decode([Chatbot].self, from: retrievedChatbotData) {
            finalChatbots = decodedChatbots
        } else {
            finalChatbots = sampleChatbots
        }
        
        chatbots = finalChatbots
    }
}

