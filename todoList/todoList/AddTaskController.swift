
//  AddTaskController.swift
//  todoList
//  Created by Surabhi Chavan on 10/25/18.

import UIKit

protocol AddTask {
    func addTask(name: String)
    func editTask(name: String)
}

class AddTaskController: UIViewController {
    
    static var isEditingItem = false
    static var currentItemText = ""
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addItemLabel: UILabel!
    
    @IBAction func addAction(_ sender: Any) {
        if AddTaskController.isEditingItem {
            if nameTextField.text != "" {
                delegate?.editTask(name: nameTextField.text!)
                AddTaskController.isEditingItem = false
                navigationController?.popViewController(animated: true)
                AddTaskController.currentItemText = ""
            }
        } else {
            if nameTextField.text != "" {
                delegate?.addTask(name: nameTextField.text!)
                navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var delegate: AddTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        if AddTaskController.isEditingItem {
            self.nameTextField.text = AddTaskController.currentItemText
            self.addItemLabel.text = "Edit your task below"
        }
        else {
            self.addItemLabel.text = "Add your task below"
        }
        
        
    }
}
