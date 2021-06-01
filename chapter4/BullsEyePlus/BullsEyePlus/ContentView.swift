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
    
    var body: some View {
        VStack {
            Text("Put the Bull's Eye as close as you can to: \(game.targetValue)")
            SliderView(game: game, currentValue: $currentValue)
            
            ButtonView(game: game, currentValue: $currentValue)
            
            TextsView(game: game)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
