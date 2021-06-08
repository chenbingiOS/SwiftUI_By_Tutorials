//
//  FlightBoard.swift
//  MountainAirport
//
//  Created by mtAdmin on 2021/6/7.
//

import SwiftUI

struct FlightBoard: View {
    var boardName: String
    var flightData: [FlightInformation]
    
    var body: some View {
        VStack {
            Text(boardName)
                .font(.title)

            ScrollView([.vertical]) {
                ForEach(flightData) { flight in
                    Text("\(flight.airline) \(flight.number)")
                    
                    Text("\(flight.flightStatus) at \(flight.currentTimeString)")
                    
                    Text("At gate \(flight.gate)")
                }
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct FlightBoard_Previews: PreviewProvider {
    static var previews: some View {
        FlightBoard(boardName: "Test", flightData: FlightInformation.generateFlights())
    }
}
