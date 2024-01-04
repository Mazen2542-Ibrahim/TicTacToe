//
//  LogoView.swift
//  TicTacToe
//
//  Created by Mogh on 25/01/1445 AH.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        
        VStack{
            Text("Tic Tac Toe")
            HStack{
                Image(systemName: Mark.xmark)
                Image(systemName: Mark.circle)
            }
        }
        .fontWeight(.semibold)
        .foregroundColor(CustomColor.secondary)
        .padding()
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
