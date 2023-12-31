//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 11/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    
    @State var selectedTheme = "Emoji"
    var body: some View {
        VStack {
            title
            ScrollView{
                cardDisplay.animation(.default, value: viewModel.cards)
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }.foregroundColor(viewModel.themeColor)
            themeButtons
        }
        .padding()
    }
    
    var themeButtons: some View {
        HStack {
            ThemeButtonView(themeName: "Emoji", themeImage: "face.smiling", viewModel: viewModel)
            Spacer()
            ThemeButtonView(themeName: "Animals", themeImage: "arrow.2.circlepath.circle", viewModel: viewModel)
            Spacer()
            ThemeButtonView(themeName: "Spooky", themeImage: "pawprint.circle", viewModel: viewModel)
        }
    }
    
    var title: some View {
        Text("Memo")
            .font(.largeTitle)
    }
    
    
    var cardDisplay : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards){ card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }.foregroundColor(viewModel.themeColor)
    }
    
}


#Preview {
    ContentView( viewModel: MemoGameViewModel())
}
