//
//  Profile.swift
//  Kuchi
//
//  Created by mtAdmin on 2021/6/4.
//

import Foundation


struct Profile: Codable {
    var name: String
    init() {
        name = ""
    }
    
    init(named name: String) {
        self.name = name
    }
}
