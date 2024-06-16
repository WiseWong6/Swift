//
//  ContentView.swift
//  StandFord-Memorize2023
//
//  Created by Wise Wong on 2024/6/2.
//

import SwiftUI

struct  EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
 
    var body: some View {
    VStack{
        ScrollView {
            Cards
        }
        Button("shuffle"){
            viewModel.shuffle()
        }
        } 
        .padding()
    }

    var Cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)], spacing:0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index]).aspectRatio(2 / 3, contentMode: .fit)
                .padding(4)
            }
        }.foregroundColor(.orange)
    }
}

struct CardView: View {
    let card : MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let baseRectangle = RoundedRectangle(cornerRadius: 12.0)
            Group{
                baseRectangle.fill(.white)
                baseRectangle.strokeBorder(lineWidth: 2.0)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1,contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1:0)
            baseRectangle.fill().opacity(card.isFaceUp ? 0:1)

        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
