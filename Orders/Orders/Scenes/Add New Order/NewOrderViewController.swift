//
//  NewOrderViewController.swift
//  Orders
//
//  Created by Islas on 3/3/20.
//  Copyright © 2020 Catskillet. All rights reserved.
//

import UIKit
import SnapKit


class NewOrderViewController: UIViewController {

    let coffeeSize = ["Small", "Medium", "Large"]
    let coffeeType = ["Cappuccino", "Latte", "Espressino", "Cortado"]
    
    lazy var newOrderView: NewOrderView = {
        let view = NewOrderView(itens: coffeeSize)
        view.tableView.delegate = self
        view.tableView.dataSource = self
        view.tableView.isScrollEnabled = false
        view.nameTextField.delegate = self
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = newOrderView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add new order"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(save))
    }
}

extension NewOrderViewController{
    @objc func save(){
        print("Save")
        navigationController?.popViewController(animated: true)
    }
    
    @objc func cancel(){
        print("Cancel")
        navigationController?.popViewController(animated: true)
    }
}

extension NewOrderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
    
}

extension NewOrderViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  NewOrderCell()
        cell.textLabel?.text = coffeeType[indexPath.row]
        return cell
    }
}

extension NewOrderViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
