//
//  EncouragementView.swift
//  Speak
//
//  Created by Wong Jun heng on 27/7/22.
//

import SwiftUI

struct EncouragementView: View {
    
    @ObservedObject var encouragementManager: EncouragementManager
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EncouragementView_Previews: PreviewProvider {
    static var previews: some View {
        EncouragementView(encouragementManager: EncouragementManager())
    }
}
