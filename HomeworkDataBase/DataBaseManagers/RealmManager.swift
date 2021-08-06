//
//  RealmManager.swift
//  HomeworkDataBase
//
//  Created by Дмитрий Старков on 06.08.2021.
//

import RealmSwift

let realm = try! Realm()

class RealmManager {
    
    static var todoArray: Results<ToDo>!
    
    static func saveObject( _ todo: ToDo) {
        try! realm.write({
            realm.add(todo)
        })
    }
    
    static func deleteObject( _ todo: ToDo){
        try! realm.write({
            realm.delete(todo)
        })
    }
    
    static func editObject(toDo: ToDo, isDone: Bool) {
        try! realm.write({
            toDo.isDone = isDone
        })
    }
    
}
