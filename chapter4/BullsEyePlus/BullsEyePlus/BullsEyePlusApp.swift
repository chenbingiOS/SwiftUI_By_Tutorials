//
//  BullsEyePlusApp.swift
//  BullsEyePlus
//
//  Created by mtAdmin on 2021/6/1.
//

import SwiftUI

@main
struct BullsEyePlusApp: App {
    
    let defaults = UserDefaults.standard
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(defaults)
        }
    }
}


extension UserDefaults: ObservableObject {}
