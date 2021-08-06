//
//  ToDoModel.swift
//  HomeworkDataBase
//
//  Created by Дмитрий Старков on 06.08.2021.
//

import Foundation
import RealmSwift

class ToDo: Object {
    @objc dynamic var name = ""
    @objc dynamic var isDone = false
    
    convenience init(name: String,isDone: Bool ) {
        self.init()
        self.name = name
        self.isDone = isDone
    }
}
