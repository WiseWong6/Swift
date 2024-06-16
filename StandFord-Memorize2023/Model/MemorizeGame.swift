//
//  MemorizeGame.swift
//  StandFord-Memorize2023
//
//  Created by Wise Wong on 2024/6/5.
//

import Foundation

struct MemoryGame<CardContent> {
    // 这是一个 Model,Model 需要的是数据和应用逻辑
    // 卡片游戏必然需要卡片，定义卡片作为数组类型，卡片需要包含是向上还是向下
    // 方法层面，记忆游戏需要选择卡牌，用于控制向上还是向下，其次需要洗牌然后重新记忆
    
    //定义一个卡片变量，是 Card 类型的数组，外部能读但是不能改
    private(set) var cards: [Card]

    //定义数组的结构体
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        // 在这里使用了 dont care 类型，不需要关心卡片内容是什么类型的,注意作用范围要在最上层

    }
    
    //记忆游戏不仅是单一的卡片，是卡片对，卡片对基于卡片初始化
    //使用 init 方法初始化赋值，接受两个参数，一个是numberOfPairsOfCards（卡片对的数量）
    //另一个是卡片内容工厂接受 Int参数 返回CardContent对象
    //即使用初始化卡片对的数量及卡片对内卡片的内容
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        //初始化一个空的卡片数组,似乎可以在外层声明时顺带初始化
        cards = [Card]()
        
        //使用一个 for 循环初始化卡片对，其范围是 0-卡片对数量（至少＞2）
        for index in 0 ..< max(2, numberOfPairsOfCards) {
            //使用 cardContentFactory 传入的 Int 和 index 为Card 结构的 content遍历赋值
            let content: CardContent = cardContentFactory(index)
            
            //cards 数组添加上述生成的卡片内容
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }

    //洗牌方法
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }

    func choose(_ card: Card) {
    
    }

    // 定义一个choose 函数，变量是 card，接受 Card 这个类型


}
