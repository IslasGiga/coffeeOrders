//
//  NewOrderCell.swift
//  Orders
//
//  Created by Islas on 3/3/20.
//  Copyright © 2020 Catskillet. All rights reserved.
//

import UIKit

class NewOrderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
        
    }

}
