//
//  RealmManager.swift
//  HomeworkDataBase
//
//  Created by Дмитрий Старков on 06.08.2021.
//

import RealmSwift

let realm = try! Realm()

class RealmManager {
    static var shared = RealmManager()
    
    var todoArray: Results<ToDo>!
    var weatherArray: Results<Weather>!

    //ToDo
    
    func saveObject( _ todo: ToDo) {
        try! realm.write({
            realm.add(todo)
        })
    }
    
   func deleteObject( _ todo: ToDo){
        try! realm.write({
            realm.delete(todo)
        })
    }
    
     func editObject(toDo: ToDo, isDone: Bool) {
        try! realm.write({
            toDo.isDone = isDone
        })
    }
    
    //Weather
    
     func saveWeahter(_ weather: [Weather]) {
        try! realm.write({
            for i in weather {
                let object = Weather(date: i.date, temp: i.temp)
                realm.add(object)
            }
        })
    }
    
    func delete() {
        try! realm.write({
            realm.deleteAll()
        })
    }
    
}
