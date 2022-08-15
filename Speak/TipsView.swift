//
//  TipsView.swift
//  Speak
//
//  Created by Wong Jun heng on 27/7/22.
//

import SwiftUI

struct TipsView: View {
    
    @ObservedObject var tipManager: TipManager
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                ScrollView {
                    VStack (alignment: .leading) {
                        Text("Browse through our hundreds of Social Etiquette tips")
                            .font(.system(.headline, design: .rounded))
                            .foregroundStyle(.primary)
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView {
                            HStack {
                                ForEach(Tip) {
                                    tips in
                                    
                                }
                            }
                        }
                    }
                    
                }
            }
        }
        .navigationTitle("Social Etiquette Tips")
}
}
struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView(tipManager: TipManager())
    }
}
    

