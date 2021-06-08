//
//  ContentView.swift
//  MountainAirport
//
//  Created by mtAdmin on 2021/6/7.
//

import SwiftUI

struct ContentView: View {
    var flightInfo: [FlightInformation] = FlightInformation.generateFlights()

    var body: some View {
        NavigationView {
            HStack {
                ZStack {
                    Image(systemName: "airplane")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250, alignment: .center)
                        .opacity(0.1)
                        .rotationEffect(.degrees(-90))
                    
                    FlightBoard(boardName: "Arrivals")
                    FlightBoard(boardName: "Departures")
                    
                    Spacer()
                }
            }
        }
        .navigationBarTitle(Text("Mountain Airport"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
