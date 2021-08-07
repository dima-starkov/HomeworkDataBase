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
    static var weatherArray: Results<Weather>!

    //ToDo
    
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
    
    //Weather
    
    static func saveWeahter(_ weather: [Weather]) {
        try! realm.write({
            for i in weather {
                let object = Weather(date: i.date, temp: i.temp)
                realm.add(object)
            }
        })
    }
    
    static func delete() {
        try! realm.write({
            realm.deleteAll()
        })
    }
    
}
