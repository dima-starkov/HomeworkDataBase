//
//  UserDefaultsManager.swift
//  HomeworkDataBase
//
//  Created by Дмитрий Старков on 06.08.2021.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let userNameKey = "Persistance.userNameKey"
    private let userSurNameKey = "Persistance.userSurNameKey"
    
    var userName: String? {
        set {UserDefaults.standard.set(newValue, forKey: userNameKey)}
        get {UserDefaults.standard.string(forKey:userNameKey)}
    }
    
    var surName: String? {
        set {UserDefaults.standard.set(newValue, forKey: userSurNameKey)}
        get {UserDefaults.standard.string(forKey:userSurNameKey)}
    }
    
}
