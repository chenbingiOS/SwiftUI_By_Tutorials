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
                    
                    VStack(alignment: .leading, spacing: 5) {
                        NavigationLink(
                            destination: FlightBoard(boardName: "Arrivals", flightData: FlightInformation.generateFlights()),
                            label: {
                                Text("Arrivals")
                            })
                        NavigationLink(
                            destination: FlightBoard(boardName: "Departures", flightData: FlightInformation.generateFlights()),
                            label: {
                                Text("Departures")
                            })
                    }
                    Spacer()
                }
                .font(.title)
                .padding(20)
            }
            .navigationBarTitle(Text("Mountain Airport"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
