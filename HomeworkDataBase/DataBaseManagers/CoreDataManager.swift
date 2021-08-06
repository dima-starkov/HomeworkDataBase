//
//  CoreDataManager.swift
//  HomeworkDataBase
//
//  Created by Дмитрий Старков on 06.08.2021.
//

import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    var tasks: [Task] = []
    
    func saveTask(_ title: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
        let taskObject = Task(entity: entity, insertInto: context)
        taskObject.title = title
        
        do{
            try context.save()
            tasks.append(taskObject)
        } catch let error as NSError{
            print(error)
        }
    }
    
    func fetchData(completion: ([Task]) -> Void ) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchReqest: NSFetchRequest<Task> = Task.fetchRequest()
     
        do {
            let tasks = try context.fetch(fetchReqest)
            completion(tasks)
        } catch let error as NSError {
            print(error)
        }
        
    }
    
    func deleteTask(_ task: Task) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        context.delete(task)
        do{
        try context.save()
        } catch let error as NSError {
        print(error.localizedDescription)
        }
    }
    
}
