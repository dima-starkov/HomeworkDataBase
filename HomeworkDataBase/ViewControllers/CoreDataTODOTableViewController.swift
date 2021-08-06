//
//  CoreDataTODOTableViewController.swift
//  HomeworkDataBase
//
//  Created by Дмитрий Старков on 06.08.2021.
//

import UIKit

class CoreDataTODOTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CoreDataManager.shared.fetchData { data in
            CoreDataManager.shared.tasks = data
        }
    }
    


    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Новая Задача", message: "Пожалуйста, заполните поле", preferredStyle: .alert)
        
        var alertTF = UITextField()
        alert.addTextField { TF in
            alertTF = TF
            TF.placeholder = "Новая Задача"
        }
        
        let save = UIAlertAction(title: "Сохранить", style: .default) { action in
            guard let text = alertTF.text , !text.isEmpty else {return}
            CoreDataManager.shared.saveTask(text)
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .destructive)
        alert.addAction(save)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataManager.shared.tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = CoreDataManager.shared.tasks[indexPath.row]
        cell.textLabel?.text = task.title

        return cell
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = CoreDataManager.shared.tasks[indexPath.row]
            CoreDataManager.shared.tasks.remove(at: indexPath.row)
            CoreDataManager.shared.deleteTask(task)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }

}
