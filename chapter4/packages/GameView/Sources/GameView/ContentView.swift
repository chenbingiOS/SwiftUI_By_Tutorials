//
//  ContentView.swift
//  BullsEyePlus
//
//  Created by mtAdmin on 2021/6/1.
//

import SwiftUI
import Game

struct ContentView: View {
    
    @ObservedObject var game = BullsEyeGame()
    @State var currentValue = 50.0
    
    var body: some View {
        VStack {
            Text("Put the Bull's Eye as close as you can to: \(game.targetValue)")
            SliderView(game: game, currentValue: $currentValue)
            
            ButtonView(game: game, currentValue: $currentValue)
            
            TextsView(game: game)
        }
    }
}


struct SliderView: View {
    @ObservedObject var game: BullsEyeGame
    @Binding var currentValue: Double
    
    var defaults: UserDefaults = UserDefaults.standard
         
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
