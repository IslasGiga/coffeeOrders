//
//  Order.swift
//  Orders
//
//  Created by Islas on 3/3/20.
//  Copyright © 2020 Catskillet. All rights reserved.
//

import Foundation

enum CoffeeType:String, CaseIterable, Codable{
    case cappuccino, latte, espressino, cortado
}

enum CoffeeSize: String, CaseIterable, Codable{
    case small, medium, large
}

struct Order: Codable{
    
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
    
}
