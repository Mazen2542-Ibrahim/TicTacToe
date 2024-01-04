//
//  GameView.swift
//  TicTacToe
//
//  Created by Mogh on 24/01/1445 AH.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    
    @State var withComputer: Bool
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                CustomColor.primary
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    if viewModel.isAnimated{
                        TitleView(withComputer: $withComputer)
                            .shadow(color: .black.opacity(0.3), radius: 3,x: 3, y: 3)
                    }else{
                        TitleView(withComputer: $withComputer)
                            .shadow(color: .black.opacity(0.3), radius: 3,x: 3, y: 3)
                    }
                    
                    Spacer()
                    
                    LazyVGrid(columns: viewModel.columns, spacing: 5){
                        ForEach(0..<9){ i in
                            ZStack{
                        
                                GameSquareView(proxy: geometry)
                                
                                PlayerIndicatorView(systemImageName: viewModel.moves[i]?.indicator ?? "")
                                    .animation(.easeInOut, value: viewModel.moves[i]?.indicator ?? "")
                            }
                            .onTapGesture {
                                withAnimation(.default){
                                    viewModel.isAnimated.toggle()
                                    if withComputer {
                                        viewModel.processPlayerVsComputerMoves(for: i)
                                    }else{
                                        viewModel.processPlayerVsPlayerMoves(for: i)
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                }
                .padding()
                .disabled(viewModel.isGameboardDisabled)
//                .alert(item: $viewModel.alertItem, content: {alertItem in
//                    Alert(title: alertItem.title,
//                          message: Text(alertItem.message ?? ""),
//                          dismissButton: .default(alertItem.buttonTitle,
//                                                  action: viewModel.resetGame))
//                })
                
                
                
                
            }
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        viewModel.showPauseMenu.toggle()
                    } label: {
                        Image(systemName: "pause.circle")
                            .foregroundColor(CustomColor.secondary)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                    }
                    .shadow(color: .black.opacity(0.3), radius: 3,x: 3, y: 3)

                }
            })
            .overlay{
                ZStack {
                    if viewModel.showPauseMenu{
                        Color.black.opacity(0.3)
                            .edgesIgnoringSafeArea(.all)
                        PauseMenuView(show: $viewModel.showPauseMenu)
                    }
                    
                    if viewModel.showAlert{
                        Color.black.opacity(0.3)
                            .edgesIgnoringSafeArea(.all)
                        CustomAlertView(show: $viewModel.showAlert)
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            GameView(withComputer: false)
        }
        .environmentObject(GameViewModel())
    }
}
