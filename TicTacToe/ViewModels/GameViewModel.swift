//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Mogh on 24/01/1445 AH.
//

import SwiftUI


final class GameViewModel: ObservableObject {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var isGameboardDisabled: Bool = false
    
    @Published var alertItem: AlertItem?
    @Published var showAlert: Bool = false
    
    @Published var isAnimated: Bool = false
    @Published var isFirstPlayer: Bool = true
    @Published var showPauseMenu: Bool = false
    
    let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    func processPlayerVsPlayerMoves(for position: Int){
        if isSquareOccupied(in: moves, forIndex: position){ return }
        processPlayerMove(for: position, isFirstPlayer ? .humen : .anotherHumen)
        isFirstPlayer.toggle()
    }
    
    func processPlayerMove(for position: Int, _ player: Player){
        if isSquareOccupied(in: moves, forIndex: position){ return }
        moves[position] = Move(player: player , boardIndex: position)
        
        // check for win
        if checkWinCondition(for: player, in: moves, winPatterns){
            alertItem = isFirstPlayer ? AlertContext.humenX : AlertContext.humenO
            showAlert.toggle()
            return
        }
        
        // check for draw
        if checkForDraw(in: moves) {
            alertItem = AlertContext.draw
            showAlert.toggle()
            return
        }
    }
    
    func processPlayerVsComputerMoves(for position: Int) {
        if isSquareOccupied(in: moves, forIndex: position){ return }
        moves[position] = Move(player: .humen , boardIndex: position)
        
        // check for win
        if checkWinCondition(for: .humen, in: moves, winPatterns){
            alertItem = AlertContext.humenWin
            showAlert.toggle()
            return
        }
        
        // check for draw
        if checkForDraw(in: moves) {
            alertItem = AlertContext.draw
            showAlert.toggle()
            return
        }
    
        isGameboardDisabled = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [self] in
            let computerPosition = determineComputerMovePosition(in: moves)
            moves[computerPosition] = Move(player: .computer , boardIndex: computerPosition)
            isGameboardDisabled = false
            
            // check for win
            if checkWinCondition(for: .computer, in: moves, winPatterns){
                alertItem = AlertContext.computerWin
                showAlert.toggle()
                return
            }
            // check for draw
            if checkForDraw(in: moves) {
                alertItem = AlertContext.draw
                showAlert.toggle()
                return
            }
        }
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: {$0?.boardIndex == index})
    }
    
    func determineWinPosition(for player: Player, in moves: [Move?], _ winPatterns: Set<Set<Int>>) -> Int? {
        var result: Int? = nil
    
        let playerMoves = moves.compactMap { $0 }.filter({ $0.player == player })
        let playerPositions = Set(playerMoves.map{ $0.boardIndex })
        
        for pattern in winPatterns {
            let winPosition = pattern.subtracting(playerPositions)
            if winPosition.count == 1 {
                let isAvailabe = !isSquareOccupied(in: moves, forIndex: winPosition.first!)
                if isAvailabe{
                    result = winPosition.first!
                }
            }
        }
        return result
    }
    
    func determineComputerMovePosition(in moves: [Move?]) -> Int {
        // if AI can win, then win.
        if let winPosition = determineWinPosition(for: .computer, in: moves, winPatterns) {
            return winPosition
        }
        
        // if AI can't win, then block.
        if let blockPosition = determineWinPosition(for: .humen, in: moves, winPatterns) {
            return blockPosition
        }
        
        // if AI can't block, then take middle square.
        let centerSquare: Int = 4
        if !isSquareOccupied(in: moves, forIndex: centerSquare){ return centerSquare }
        
        // if AI can't take middle square, take random available saquare.
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePosition){
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
    
    func checkWinCondition(for player: Player, in moves: [Move?], _ winPatterns: Set<Set<Int>>) -> Bool{
        // Filter that removes all nil position and return player moves
        let playerMoves = moves.compactMap { $0 }.filter({ $0.player == player })
        // return a set of player move index
        let playerPositions = Set(playerMoves.map{ $0.boardIndex })
        
        for pattern in winPatterns where pattern.isSubset(of: playerPositions) { return true }
        
        return false
    }
    
    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap{ $0 }.count == 9
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
        isFirstPlayer = true
    }
    
}
