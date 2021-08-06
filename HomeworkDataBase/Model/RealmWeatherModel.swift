//
//  RealmWeatherModel.swift
//  HomeworkDataBase
//
//  Created by Дмитрий Старков on 06.08.2021.
//

import Foundation
import RealmSwift

class Weather: Object {
    @objc dynamic var date = ""
    @objc dynamic var temp = ""
    
    convenience init(date: String,temp: String) {
        self.init()
        self.date = date
        self.temp = temp
    }
    
}
