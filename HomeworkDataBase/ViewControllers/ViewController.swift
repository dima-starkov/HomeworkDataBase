//
//  ViewController.swift
//  HomeworkDataBase
//
//  Created by Дмитрий Старков on 06.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = UserDefaultsManager.shared.userName,
           let surname = UserDefaultsManager.shared.surName {
            textLabel.text = "Hello \(name) \(surname)"
        } else {
            textLabel.text = "Hello"
        }
    }

    @IBAction func okButton(_ sender: UIButton) {
        guard let name = nameTextField.text,
              let surName = surnameTextField.text else {return}
        UserDefaultsManager.shared.userName = name
        UserDefaultsManager.shared.surName = surName
        
    }
    
}

