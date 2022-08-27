//
//  TipsView.swift
//  Speak
//
//  Created by Wong Jun heng on 27/7/22.
//

import SwiftUI

struct TipsView: View {
    
    @ObservedObject var tipManager: TipManager
    @State var isTipPresented = false
    @State var randomTip = Tip.sample
    @State var allTips = Tip.all
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                NavigationView {
                    ScrollView {
                        List {
                            ForEach($tipManager.tips) { $tip in
                                NavigationLink {
                                    TipDetailView(tips: $tips)
                                } label: {
                                    HStack {
                                        
                                    }
                                }
                            }
                                
                            
                        }
                        
                    }
                        }
                    }
                    
                }
            }
        }
        //.navigationTitle("Social Etiquette Tips")


struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView(tipManager: TipManager())
    }
}
    

