//
//  MenuView.swift
//  TicTacToe
//
//  Created by Mogh on 25/01/1445 AH.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            CustomColor.primary
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                Spacer()
                
                LogoView()
                    .font(.system(size: 45))
                    .shadow(color: .black.opacity(0.7), radius: 3, x: 3, y: 3)
                
                Spacer()
                
                NavigationLink(destination: GameView(withComputer: false)) {
                    CustomButton(image1: "person", image2: "person")
                }
                .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                
                NavigationLink(destination: GameView(withComputer: true)) {
                    CustomButton(image1: "person", image2: "bot")
                }
                .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                
                Spacer()
                Spacer()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MenuView()
        }
        .environmentObject(GameViewModel())
    }
}

struct CustomButton: View {
    @State var image1: String
    @State var image2: String
    var body: some View {
        HStack{
            Image(image1)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 30)
            
            Text("vs.")
                .fontWeight(.bold)
            
            Image(image2)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 30)

        }
        .frame(width: 280, height: 50)
        .background(CustomColor.secondary)
        .foregroundColor(CustomColor.primary)
        .cornerRadius(10)
    }
}
