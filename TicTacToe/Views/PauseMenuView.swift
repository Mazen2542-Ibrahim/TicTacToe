//
//  PauseMenuView.swift
//  TicTacToe
//
//  Created by Mogh on 25/01/1445 AH.
//

import SwiftUI



struct PauseMenuView: View {
    
    @Binding var show: Bool
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(spacing: 25){
                LogoView()
                    .font(.system(size: 30))
                    .shadow(color: .black.opacity(0.7), radius: 3, x: 3, y: 3)
                    .padding()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                    show.toggle()
                    viewModel.resetGame()
                } label: {
                    Text("Back To Menu")
                        .foregroundColor(CustomColor.primary)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(CustomColor.secondary)
                        .cornerRadius(10)
                }
                .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background(BlurView(style: .systemUltraThinMaterialDark))
            .cornerRadius(25)
            
            Button {
                withAnimation{
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(CustomColor.secondary)
            }
            .shadow(color: .black.opacity(0.3), radius: 3,x: 3, y: 3)
            .padding()

            
        }
    }
}

struct PauseMenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        PauseMenuView(show: .constant(false))
            .environmentObject(GameViewModel())
    }
}
