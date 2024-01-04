//
//  TitleView.swift
//  TicTacToe
//
//  Created by Mogh on 25/01/1445 AH.
//

import SwiftUI

struct TitleView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    @Binding var withComputer: Bool
    
    var body: some View {
        HStack{
            Text("Turn:")
            if withComputer{
                if viewModel.isGameboardDisabled{
                    Image(systemName: Mark.circle)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }else{
                    Image(systemName: Mark.xmark)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }else{
                if viewModel.isFirstPlayer{
                    Image(systemName: Mark.xmark)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }else{
                    Image(systemName: Mark.circle)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }
        }
        .foregroundColor(CustomColor.secondary)
        .font(.title)
        .fontWeight(.bold)
        .animation(.easeInOut, value: viewModel.isGameboardDisabled)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TitleView(withComputer: .constant(false))
        }
        .environmentObject(GameViewModel())
    }
}
