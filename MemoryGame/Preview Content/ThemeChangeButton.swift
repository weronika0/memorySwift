//
//  ThemeChangeButton.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import SwiftUI

struct ThemeButtonView: View {
    let themeName: String
    let themeImage: String
    @ObservedObject var viewModel: MemoGameViewModel
    var body: some View {
        Button(action: {
            viewModel.selectedTheme = themeName
            viewModel.changeTheme()
            viewModel.shuffle()
        }) {
            VStack {
                Image(systemName: themeImage)
                    .font(.system(size: 24))
                Text(themeName)
                    .font(.caption)
            }
        }.foregroundColor(viewModel.themeColor)
    }
    
}

#Preview {
    ThemeButtonView(themeName: "Emoji", themeImage: "face.smiling", viewModel: MemoGameViewModel())
}

