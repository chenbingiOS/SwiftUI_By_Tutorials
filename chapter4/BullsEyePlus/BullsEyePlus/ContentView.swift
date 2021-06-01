//
//  ContentView.swift
//  BullsEyePlus
//
//  Created by mtAdmin on 2021/6/1.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var game = BullsEyeGame()
    @State var currentValue = 50.0
    @State var showAlert = false

    var body: some View {
        VStack {
            Text("Put the Bull's Eye as close as you can to: \(game.targetValue)")
            SliderView(game: game, currentValue: $currentValue)
            
            Button(action: {
                showAlert = true
                game.checkGuess(Int(currentValue))
            }, label: {
                Text("Hit Me!")
            }).alert(isPresented: $showAlert, content: {
                Alert(title: Text("Your Score"), message: Text(String(game.scoreRound)), dismissButton: .default(Text("OK"), action: {
                    game.startNewRound()
                    currentValue = 50.0
                }))
            })
            .padding()
            
            HStack {
                Text("Total Score: \(game.scoreTotal)")
                Text("Round: \(game.round)")
            }
        }
    }
}

struct SliderView: View {
    @ObservedObject var game: BullsEyeGame
    @Binding var currentValue: Double
    
    @EnvironmentObject var defaults: UserDefaults
    
     
    var body: some View {
        HStack {
            Text("0")
            
            if defaults.bool(forKey: "show_hint") {
                Slider(value: $currentValue, in: 1.0...100.0, step: 1.0)
                    .background(Color.blue)
                    .opacity(abs((Double(game.targetValue) - currentValue)/100.0))
            } else {
                Slider(value: $currentValue, in: 1.0...100.0, step: 1.0)
            }
            
            Text("100")
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
