//
//  ContentView.swift
//  StandFord-Memorize2023
//
//  Created by Wise Wong on 2024/6/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           CardView(isFaceUp: true)
           CardView()
           CardView()
           CardView()
           
        }
        .foregroundColor(.orange)
        .font(.largeTitle)
        .padding()
    }
}

struct CardView:View {
    var isFaceUp = false
    var body: some View {
        ZStack(content: {
            if isFaceUp {
            RoundedRectangle(cornerRadius: 12.0)
                .fill(.white)
            RoundedRectangle(cornerRadius: 12.0)
                .strokeBorder(lineWidth: 3.0)
            Text("🐡")
            }else{
            RoundedRectangle(cornerRadius: 12.0)
        }
        })
    }
}



#Preview {
    ContentView()
}
