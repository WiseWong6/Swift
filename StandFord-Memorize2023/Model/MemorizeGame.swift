//
//  MemorizeGame.swift
//  StandFord-Memorize2023
//
//  Created by Wise Wong on 2024/6/5.
//

import Foundation

struct MemoryGame<CardContent>{


    private(set) var cards:Array<Card>
    //变量 cards 是一个"Card"类型元素组成的数组，Card是一种自定义类型或者结构体
    //private（set）和private的区别是，前者是只读属性，外部能读但是不能改，后者则是外部不能看也不能改
    
    init(numberOfPairsOfCards:Int,cardContentFactory:(Int) -> CardContent ){
        cards = Array<Card>()
//        cards = [Card]()
//        cards = []

//      add numberOfPairsOfCards x 2cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content : CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content)) 
        }

    }
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
     }
     func choose(_ card:Card){
     
     }
     //定义一个choose 函数，变量是 card，接受 Card 这个类型
     
     struct Card{
        var isFaceUp = true
        var isMatched = false
        let content:CardContent
     }
     
     //结构体 Card，应该包含是不是面朝上，是否是匹配的，卡片的内容是什么
     //在这里使用了 dont care 类型，不需要关心卡片内容是什么类型的,注意作用范围要在最上层
}
