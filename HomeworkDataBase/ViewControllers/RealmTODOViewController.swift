//
//  RealmTODOViewController.swift
//  HomeworkDataBase
//
//  Created by Дмитрий Старков on 06.08.2021.
//

import UIKit

class RealmTODOViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        RealmManager.todoArray = realm.objects(ToDo.self)
        
    }
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Новая Задача", message: "Пожалуйста, заполните поле", preferredStyle: .alert)
        
        var alertTF = UITextField()
        alert.addTextField { TF in
            alertTF = TF
            TF.placeholder = "Новая Задача"
        }
        
        
        let save = UIAlertAction(title: "Сохранить", style: .default) { action in
            guard let text = alertTF.text , !text.isEmpty else {return}
           let newToDo = ToDo(name: text, isDone: false)
            RealmManager.saveObject(newToDo)
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .destructive)
        alert.addAction(save)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    //MARK:- TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RealmManager.todoArray.isEmpty ? 0 : RealmManager.todoArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        let toDo = RealmManager.todoArray[indexPath.row]
        cell.textLabel?.text = toDo.name
        if toDo.isDone {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }

   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete {
        let toDo = RealmManager.todoArray[indexPath.row]
           RealmManager.deleteObject(toDo)
           tableView.deleteRows(at: [indexPath], with: .left)
       }
   }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = RealmManager.todoArray[indexPath.row]
        if toDo.isDone {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        RealmManager.editObject(toDo: toDo, isDone: !toDo.isDone)
    }
   

}
