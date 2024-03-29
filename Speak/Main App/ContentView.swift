//
//  ContentView.swift
//  Speak
//
//  Created by Wong Jun heng on 10/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var tipManager = TipManager()
    @StateObject var factManager = FactManager()
    @StateObject var encouragementManger = EncouragementManager()
    @StateObject var chatbotManager = ChatbotManager()
    @StateObject var settingManager = SettingManager()
    
    var body: some View {
        TabView {
            TipsView(tipManager: tipManager)
                .tabItem {
                    Label("Social Etiquette tips", systemImage: "quote.bubble")
                }
            
            FactsView(factManager: factManager)
                .tabItem {
                    Label("Fun Facts/Jokes", systemImage: "face.smiling")
                }
            
            EncouragementView(encouragementManager: encouragementManger)
                .tabItem {
                    Label("Encouraging messages", systemImage: "heart")
                }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    

}
