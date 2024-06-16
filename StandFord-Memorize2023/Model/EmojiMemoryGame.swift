//
//  EmojiMemoryGame.swift
//  StandFord-Memorize2023
//
//  Created by Wise Wong on 2024/6/5.
//

// View 和 ViewModel 都是 UI 的一部分，所以可以 importSwiftUI
// 这是一个 ViewModel,它是 UI 的一部分，但不是 View

import SwiftUI

class EmojiMemoryGame :ObservableObject{
    private static let emojis = ["👹", "🤡", "👻", "👿", "💀", "☠️", "👽", "👾", "🤖", "🎃", "👺", "🤠"]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 16) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }

    // 初始化一个 model 变量，调用Model 的 MemoryGame 结构体，String 是卡片的内容
    // 设置private过后，只有这个ViewModel能够调用这个model
    // 设置为static表示全局函数

    @Published private var model = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }

    // 初始化一个卡片的变量，定义为数组，并且调用 Model 里的 MemoryGame 中 Card 的结构体
    
    //Mark: - Intents 
    func shuffle(){
        model.shuffle()
        objectWillChange.send()
    }
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    // 初始化一个方法，变量名称是 card，值的结构是 Model 中的卡片类型
    // 变量传入部分和方法部分看不懂
}
