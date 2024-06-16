//
//  StandFord_Memorize2023App.swift
//  StandFord-Memorize2023
//
//  Created by Wise Wong on 2024/6/2.
//

import SwiftUI

@main
struct StandFord_Memorize2023App: App {
    @StateObject var game = EmojiMemoryGame()
        
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
