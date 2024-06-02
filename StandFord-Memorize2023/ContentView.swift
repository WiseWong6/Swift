//
//  ContentView.swift
//  StandFord-Memorize2023
//
//  Created by Wise Wong on 2024/6/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
           CardView(content: "👹")
           CardView(content: "🤡")
           CardView(content: "👻")
           CardView(content: "👿")
           
        }
        .foregroundColor(.orange)
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
