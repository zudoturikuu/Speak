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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView(tipManager: TipManager())
    }
}
