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
    }
}

extension NewOrderViewController{
    @objc func save(){
        print("Save")
    }
}

extension NewOrderViewController: UITableViewDelegate {
    
}

extension NewOrderViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
        cell.textLabel?.text = coffeeType[indexPath.row]
        return cell
    }
    
    
}
