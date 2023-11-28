//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 14/11/2023.
//

import SwiftUI


class MemoGameViewModel: ObservableObject{
    private static var emojis = ["😂", "😁", "🥺", "🤪", "🥺", "🤪", "😁", "😂"]
    @Published private var model = createMemoGameModel()
    @Published var selectedTheme: String = "Emoji"

    
    private static func createMemoGameModel() -> MemoGameModel<String>{
        return MemoGameModel<String>(
            numberPairsOfCard: 10) {index in
                if emojis.indices.contains(index){
                    return emojis[index]
                }else{
                    return "??"
                }
            }
    }
    
    var cards: Array<MemoGameModel<String>.Card>{
        return model.cards
    }
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoGameModel<String>.Card){
        model.choose(card)
    }
    
    func changeTheme() {
            switch selectedTheme {
            case "Animals":
                MemoGameViewModel.emojis = ["🐹", "🐷", "🐰", "🦋", "🐞", "🐳", "🐥", "🦆"]
            case "Spooky":
                MemoGameViewModel.emojis = ["👻", "💀", "🎃", "🧛🏻", "🧟‍♀️", "🧙🏻‍♂️", "🕷️"]
            default:
                MemoGameViewModel.emojis = ["😂", "😁", "🥺", "🤪"]
            }
        model = MemoGameViewModel.createMemoGameModel()
    }
    
    var themeColor: Color {
            switch selectedTheme {
            case "Animals": return .green
            case "Spooky": return .purple
            default: return .yellow
            }
        }
    
}

