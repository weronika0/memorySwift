//
//  ThemeChangeButton.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import SwiftUI

struct ThemeChangeButton: View {
    let tekst: String
    let symbol: String
    let dzialanie: () -> ()
    var body: some View {
        VStack{
            Image(systemName: symbol).font(.largeTitle)
            Text(tekst)
        }.onTapGesture{
            dzialanie()
        }
    }
}

#Preview {
    ThemeChangeButton(tekst: "napis", symbol: "OK", dzialanie: {})
}
