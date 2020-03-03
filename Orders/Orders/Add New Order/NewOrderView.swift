//
//  NewOrderView.swift
//  Orders
//
//  Created by Islas on 3/3/20.
//  Copyright © 2020 Catskillet. All rights reserved.
//

import UIKit

class NewOrderView: UIView {

    let tableView: UITableView = {
        let table = UITableView(frame: .zero)
        return table
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl(items: itens)
        return segmented
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nome"
        return textField
    }()
    
    var itens: [String]

    init(itens: [String]){
        self.itens = itens
        super.init(frame: .zero)
        initialize()
        installConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize(){
        addSubview(tableView)
        addSubview(segmentedControl)
        addSubview(nameTextField)
    }
    
    func installConstraints(){
        tableView.snp.makeConstraints({
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        })
        
        segmentedControl.snp.makeConstraints({
            $0.top.equalTo(tableView.snp.bottom).offset(16)
            $0.left.equalTo(tableView.snp.bottom).offset(16)
            $0.right.equalTo(tableView.snp.bottom).inset(16)
        })
        
        nameTextField.snp.makeConstraints({
            $0.top.equalTo(segmentedControl.snp.bottom).offset(16)
            $0.left.equalTo(segmentedControl.snp.bottom).offset(16)
            $0.right.equalTo(segmentedControl.snp.bottom).inset(16)
        })
    }
}
