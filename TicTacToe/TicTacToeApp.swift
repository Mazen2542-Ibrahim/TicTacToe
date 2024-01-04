//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Mogh on 24/01/1445 AH.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    
    @StateObject var viewModel: GameViewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                MenuView()
            }
            .environmentObject(viewModel)
        }
    }
}
