//
//  WelcomeView.swift
//  Kuchi
//
//  Created by mtAdmin on 2021/6/3.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("welcome-background")
                .resizable()
                .aspectRatio(1 / 1, contentMode: .fill)
//                .edgesIgnoringSafeArea(.all)
                .saturation(0.5)
                .blur(radius: 5)
                .opacity(0.08)
            HStack {
                Image(systemName: "table")
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .center)
                    .cornerRadius(60 / 2)
                    .background(Color(white: 0.9))
                    .clipShape(Circle())
                    .foregroundColor(.red)
//                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle()
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                VStack {
                    Text("Welcome to")
                        .font(.headline)
                        .bold()
                    Text("Kuchi")
                        .font(.largeTitle)
                        .bold()
                }
                .foregroundColor(.red)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
