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
           CardView()
           CardView()
           CardView()
           CardView()
           
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView:View {
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let baseRectangle = RoundedRectangle(cornerRadius: 12.0)
            if isFaceUp {
                baseRectangle.fill(.white)
                baseRectangle.strokeBorder(lineWidth: 2.0)
                Text("🐡").font(.largeTitle)
            }else{
                baseRectangle
        }
        }.onTapGesture{
            print("当前ifFaceUp的值是\(isFaceUp)")
            isFaceUp.toggle()
            print("点击后ifFaceUp的值是\(isFaceUp)")
        }
    }
}



#Preview {
    ContentView()
}
