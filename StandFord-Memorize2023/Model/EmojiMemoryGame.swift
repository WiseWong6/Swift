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

    //对于 ViewModel 来说，需要使用 model 的方法，首先需要拥有 1 个 model
    //model的初始值等于 creatMemoryGame 函数的返回值
    @Published private var model = createMemoryGame()

    //定义createMemoryGame函数，返回 MemoryGame<String>对象
    //传入卡片对数量是 16 对，初始化card 和 cards 卡片组
    //MemoryGame里使用 numberOfPairsOfCards 的时候还需要对内容进行初始化，后面的闭包实际上在返回 content
    //index会自动递增，基于语言的特点。
    //如果 emojis 的范围包含某个索引则返回某个索引的值，否则返回特殊符号
    // 设置为static表示全局函数

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12) { index in
            if emojis.indices.contains(index) {
                return emojis[index]
            } else {
                return "⁉️"
            }
        }
    }
    
    // 初始化一个卡片的变量，定义为数组，并且调用 Model 里的 MemoryGame 中 Card 的结构体
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    //Mark: - Intents 
    func shuffle(){
        model.shuffle()
    }
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
