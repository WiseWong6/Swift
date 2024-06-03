//
//  ContentView.swift
//  StandFord-Memorize2023
//
//  Created by Wise Wong on 2024/6/2.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👹","🤡","👻","👿","💀","☠️","👽","👾","🤖","🎃","👺","🤠"]
    @State var cardsCount = 4
    
    var body: some View {
        VStack{
            ScrollView{
                Cards
            }
            Spacer()
            CardsCountAdjuster
        }
        .padding()
    }
    var Cards:some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120.0))], content: {
            ForEach(0..<cardsCount,id: \.self) { index in
            CardView(content: emojis[index])
                .aspectRatio(4/3, contentMode: .fill)
            }
        }).foregroundColor(.orange)
    }
    
    var CardsCountAdjuster:some View{
        HStack{
            CardAdder
            Spacer()
            CardRemover
    
        }.font(.headline)
    }
    
    func ButtonSimplify(by offset:Int,symbol:String,txt:String)->some View{
        Button(action: {
            cardsCount +=  offset
            print("当前卡片数量是：\(cardsCount)个")

        }, label: {
            Image(systemName: symbol)
            Text(txt)
        }).buttonStyle(.bordered).disabled(cardsCount + offset > emojis.count || cardsCount + offset < 1)
        
    }
    
    var CardAdder:some View{
        ButtonSimplify(by: 1, symbol: "rectangle.stack.badge.plus.fill", txt:"添加卡片")
        
        }
        
    var CardRemover:some View{
        ButtonSimplify(by: -1, symbol:"rectangle.stack.badge.minus.fill", txt: "删除卡片")
        }
}



struct CardView:View {
    var content:String
    
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let baseRectangle = RoundedRectangle(cornerRadius: 12.0)
            if isFaceUp {
                baseRectangle.fill(.white)
                baseRectangle.strokeBorder(lineWidth: 2.0)
                Text(content).font(.largeTitle)
            }else{
                baseRectangle
        }
        }.onTapGesture{
            print("当前isFaceUp的值是\(isFaceUp)")
            isFaceUp.toggle()
            print("点击后isFaceUp的值是\(isFaceUp)")
        }
    }
}



#Preview {
    ContentView()
}
