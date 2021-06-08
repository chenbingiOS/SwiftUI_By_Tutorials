//
//  UserManager.swift
//  Kuchi
//
//  Created by mtAdmin on 2021/6/4.
//

import Foundation

final class UserManager: ObservableObject {
    @Published var profile: Profile = Profile()
    @Published var settings: Settings = Settings()
    @Published var isRegistered: Bool
    
    init() {
        isRegistered = false
        load()
    }
    
    init(name: String) {
        isRegistered = name.isEmpty == false
        profile.name = name
    }
    
    func setReigstered() {
        isRegistered = profile.name.isEmpty == false
    }
    
    func persistProfile() {
        if settings.rememberUser {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(profile), forKey: "user-profile")
        }
    }
    
    func persistSettings() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(settings), forKey: "user-settings")
    }
    
    func load() {
        if let data = UserDefaults.standard.value(forKey: "user-profile") as? Data,
           let profile = try? PropertyListDecoder().decode(Profile.self, from: data) {
            self.profile = profile
        }
        
        setReigstered()
        
        if let data = UserDefaults.standard.value(forKey: "user-profile") as? Data,
           let settings = try? PropertyListDecoder().decode(Settings.self, from: data) {
            self.settings = settings
        }
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: "user-profile")
    }
    
    func isUserNameValid() -> Bool {
        profile.name.count >= 3
    }
}
