//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 11/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    let symbolsEmoji: Array = ["😂", "😁", "🥺", "🤪", "🥺", "🤪", "😁", "😂"]
    let symbolsAnimal: Array = ["🐹", "🐷", "🐰", "🦋", "🐞", "🐳", "🐥", "🦆", "🐹", "🐷", "🐰", "🦋", "🐞", "🐳", "🐥", "🦆"]
    let symbolsSpooky: Array = ["👻", "💀", "🎃", "🧛🏻", "🧟‍♀️", "🧙🏻‍♂️", "🕷️", "👻", "💀", "🎃", "🧛🏻", "🧟‍♀️", "🧙🏻‍♂️", "🕷️"]
    @State var symbols: Array = ["😁", "☺️", "😜", "🥺", "🐰", "🦋", "🐞", "🐳", "🟡"]
    @State var cardsCounter: Int = 4
    @State var selectedTheme: Color = .yellow
    
    func shuffleSymbols(symbolsArray: Array<String>){
        symbols = symbolsArray.shuffled()
    }
    
    var themeButtons: some View {
        HStack{
            ThemeChangeButton(tekst: "Emoji", symbol: "face.smiling", dzialanie: {
                selectedTheme = .yellow
                cardsCounter = 8
                shuffleSymbols(symbolsArray: symbolsEmoji)}).foregroundColor(selectedTheme)
            Spacer()
            ThemeChangeButton(tekst: "Animals", symbol: "pawprint.circle", dzialanie: {
                selectedTheme = .green
                cardsCounter = 16
                shuffleSymbols(symbolsArray: symbolsAnimal)}).foregroundColor(selectedTheme)
            Spacer()
            ThemeChangeButton(tekst: "Spooky", symbol: "moonphase.waxing.gibbous", dzialanie: {
                selectedTheme = .purple
                cardsCounter = 14
                shuffleSymbols(symbolsArray: symbolsSpooky)}).foregroundColor(selectedTheme)
        }
    }
    
    var cardAdd: some View {
            adjustCardNumber(by: 2, symbol: "+")
        }

        var cardRemove : some View {
            adjustCardNumber(by: -2, symbol: "-")
        }

        func adjustCardNumber(by offset: Int, symbol: String) -> some View{
            let newCounter = cardsCounter + offset
            if(symbol == "+"){
                return Button(action: {
                    if newCounter >= 0 && newCounter <= symbols.count {
                       cardsCounter = newCounter
                    }
                }){
                    Image(systemName: "plus.app").font(.largeTitle)
                }.disabled(cardsCounter >= symbols.count)
            }
                return Button(action: {
                    if newCounter >= 0 && newCounter <= symbols.count {
                       cardsCounter = newCounter
                    }
                }){
                    Image(systemName: "minus.square").font(.largeTitle)
                }.disabled(cardsCounter <= 0)
            }
    
    var cardDisplay: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach (0..<cardsCounter, id: \.self) {index in
                CardView(content: symbols[index]).aspectRatio(2/3, contentMode: .fit).foregroundColor(selectedTheme)
            }
        }
    }
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            ScrollView {
                cardDisplay
            }
            Spacer()
            themeButtons
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
        
    
    

    
