//
//  PlayerIndicatorView.swift
//  TicTacToe
//
//  Created by Mogh on 24/01/1445 AH.
//

import SwiftUI

struct PlayerIndicatorView: View {
    
    var systemImageName: String
    
    var body: some View {
        if systemImageName == Mark.xmark{
            Image(systemName: Mark.xmark)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(CustomColor.primary)
                .fontWeight(.semibold)
                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
        }
        if systemImageName == Mark.circle{
            Image(systemName: Mark.circle)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(CustomColor.primary)
                .fontWeight(.semibold)
                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
        }
    }
}

struct PlayerIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerIndicatorView(systemImageName: Mark.xmark)
    }
}
