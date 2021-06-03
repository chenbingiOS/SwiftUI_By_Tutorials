//
//  ContentView.swift
//  BullsEyePlusWatch Extension
//
//  Created by mtAdmin on 2021/6/1.
//

import SwiftUI
import Game

struct ContentView: View {
    
    @ObservedObject var game = BullsEyeGame()
    @State var currentValue = 50.0
    
    private var alpha: Double {
      abs(Double(game.targetValue) - currentValue) / 100.0
    }
    
    var body: some View {
        VStack {
            Text("Aim to: \(game.targetValue)")
            HStack {
              Text("0")
              Slider(value: $currentValue, in: 1.0...100.0)
                  .digitalCrownRotation($currentValue, from: 1.0, through: 100.0)
                .background(Color.blue)
                .opacity(alpha)
              Text("100")
            }
            .padding(.horizontal)
            
            ButtonView(game: game, currentValue: $currentValue)
            
            TextsView(game: game)
        }
    }
}

struct ButtonView: View {
    @ObservedObject var game: BullsEyeGame
    @Binding var currentValue: Double
    @State var showAlert = false
    
    var body: some View {
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
    }
}

struct TextsView: View {
    @ObservedObject var game: BullsEyeGame
    
    var body: some View {
        HStack {
            Text("Total Score: \(game.scoreTotal)")
            Text("Round: \(game.round)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
