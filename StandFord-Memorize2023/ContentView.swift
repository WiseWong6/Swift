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
            HStack {

                ForEach(0..<cardsCount,id: \.self) { index in
                CardView(content: emojis[index])
                //ForEach的 range 使用 cardsCount 的初始值设定范围
                //id:\.self,使用这个范围作为唯一标识符
                //index 则为变量则为这个元素的索引
                //in是语法的一部分，表示分隔前面的集合和后面的闭包参数，也指明将遍历集合每个参数所带来的元素值
                }
           
            }
            .foregroundColor(.orange)
        
            HStack{
                Button(action: {
                    if cardsCount < emojis.count{
                        cardsCount +=  1
                    }
                }, label: {
                    Image(systemName: "rectangle.stack.badge.minus.fill")
                    Text("添加卡片")
                }).buttonStyle(.bordered)
                Spacer()
                Button(action: {
                    if cardsCount > 1{
                        cardsCount -=  1
                    }
                }, label: {
                    Image(systemName: "rectangle.stack.badge.minus.fill")
                    Text("删除卡片")
                }).buttonStyle(.bordered)
            }.font(.headline)
        }
       

        
        .padding()
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
