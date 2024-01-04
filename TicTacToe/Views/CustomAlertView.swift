//
//  CustomAlertView.swift
//  TicTacToe
//
//  Created by Mogh on 27/01/1445 AH.
//

import SwiftUI

struct CustomAlertView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    @Binding var show: Bool
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(spacing: 25){
                
                Text(viewModel.alertItem?.title ?? "Title")
                    .font(.system(.title2))
                    .fontWeight(.semibold)
                    .foregroundColor(CustomColor.secondary)
                    .shadow(color: .black.opacity(0.7), radius: 3, x: 3, y: 3)
                
                
                Text(viewModel.alertItem?.message ?? "")
                    .font(.system(.subheadline))
                    .foregroundColor(CustomColor.secondary)
                    .frame(maxWidth: 200)
                    .shadow(color: .black.opacity(0.7), radius: 3, x: 3, y: 3)
                
                Button {
                    withAnimation {
                        show.toggle()
                        viewModel.resetGame()
                    }
                } label: {
                    Text(viewModel.alertItem?.buttonTitle ?? "Button")
                        .foregroundColor(CustomColor.primary)
                        .fontWeight(.semibold)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 18)
                        .background(CustomColor.secondary)
                        .cornerRadius(10)
                }
                .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background(BlurView(style: .systemUltraThinMaterialDark))
            .cornerRadius(25)
            

            
        }
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(show: .constant(false))
            .environmentObject(GameViewModel())
    }
}
