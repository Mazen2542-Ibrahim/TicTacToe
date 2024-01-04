//
//  AlertsModel.swift
//  TicTacToe
//
//  Created by Mogh on 24/01/1445 AH.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: String
    var message: String?
    var buttonTitle: String
}

struct AlertContext {
    static let humenWin    = AlertItem(title: "You Win",
                                       message:"You are so smart. You beat the AI.",
                                       buttonTitle: "Again")
    
    static let computerWin = AlertItem(title: "You Lost",
                                       message: "You lost to a machine 🤖.",
                                       buttonTitle: "Rematch")
    
    static let draw        = AlertItem(title: "Draw",
                                       message: "What a battle of wits we had here...",
                                       buttonTitle: "Try Again")
    
    static let humenX      = AlertItem(title: "X Won",
                                       message: nil,
                                       buttonTitle: "Rematch")
    
    static let humenO      = AlertItem(title: "O Won",
                                       message: nil,
                                       buttonTitle: "Rematch")
    
}
