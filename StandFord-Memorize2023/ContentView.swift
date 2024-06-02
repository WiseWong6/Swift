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
            //LazyVGrid，是一种网格函数，columns 可以指定函数列，不能使用数字，要使用网格项数组
            //GridItem 有一种自适应方法，但需要指定最小宽邸
        
            ForEach(0..<cardsCount,id: \.self) { index in
            CardView(content: emojis[index])
                .aspectRatio(2/3, contentMode: .fill)
            //ForEach的 range 使用 cardsCount 的初始值设定范围
            //id:\.self,使用这个范围作为唯一标识符
            //index 则为变量则为这个元素的索引
            //in是语法的一部分，表示分隔前面的集合和后面的闭包参数，也指明将遍历集合每个参数所带来的元素值
            //aspectRatio是宽高比,含有参数 aspect ratio，2/3即宽度和高度的比例
            //contentMode是内容模式，前侧指定了宽高比，.fill 则拉伸来完成这个宽高比,看最新语法只有 fill 和 fit，前者是填充，后者是缩放
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
        //by 关键字通常用于指定一个修饰符（modifier）的参数，该修饰符会基于某个值的变化来应用某种效果或行为。
        //offset单词指偏移量，并指定为整形，方法传递这个值给函数，然后根据这个值来创建按钮并运行逻辑。
        Button(action: {
            cardsCount +=  offset
            //参考cardsCount +=  1，即 cardsCount=cardsCount+1，即现值+1，并重新赋值原值
            //对应上文，则为 cardsCount+offset 的结果赋值原值
            //假设cardsCount=4，传值 1，则为4+1=5，传值-1，则为 4-1=3
            print("\(cardsCount)")

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
