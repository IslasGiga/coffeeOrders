//
//  NewOrderView.swift
//  Orders
//
//  Created by Islas on 3/3/20.
//  Copyright © 2020 Catskillet. All rights reserved.
//

import UIKit
import SnapKit

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
        textField.borderStyle = .none
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
        backgroundColor = .white
        addSubview(tableView)
        addSubview(segmentedControl)
        addSubview(nameTextField)
    }
    
    func installConstraints(){
        tableView.snp.makeConstraints({
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(250)
        })
        
        segmentedControl.snp.makeConstraints({
            $0.top.equalTo(tableView.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().inset(16)
        })
        
        nameTextField.snp.makeConstraints({
            $0.top.equalTo(segmentedControl.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().inset(16)
            $0.height.equalTo(26)
        })
    }
}
