//
//  GameSquareView.swift
//  TicTacToe
//
//  Created by Mogh on 24/01/1445 AH.
//

import SwiftUI

struct GameSquareView: View {
    
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(CustomColor.secondary)
            .frame(width: proxy.size.width / 3 - 15,
                   height: proxy.size.width / 3 - 15)
            .shadow(color: .black.opacity(0.3), radius: 3,x: 3, y: 3)
    }
}

struct GameSquareView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ geometry in
            GameSquareView(proxy: geometry)
        }

    }
}
