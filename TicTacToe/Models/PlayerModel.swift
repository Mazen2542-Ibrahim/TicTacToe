//
//  PlayerModel.swift
//  TicTacToe
//
//  Created by Mogh on 24/01/1445 AH.
//

import SwiftUI

enum Player {
    case humen, computer, anotherHumen
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .computer || player == .anotherHumen ? Mark.circle : Mark.xmark
    }
}



