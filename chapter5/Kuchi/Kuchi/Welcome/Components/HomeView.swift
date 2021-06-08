//
//  HomeView.swift
//  Kuchi
//
//  Created by mtAdmin on 2021/6/3.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.dock")
                        Text("Challenge")
                    }
                }
                .tag(1)
            
            ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "chart.bar")
                        Text("Progress")
                    }
                }
                .tag(2)
            
            ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }
                .tag(3)
        }
        .accentColor(.orange)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
