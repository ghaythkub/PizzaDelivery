//
//  PizzaModel.swift
//  PizzaDelivery
//
//  Created by Ghayth Kubaisi on 3/26/19.
//  Copyright © 2019 Ghayth Kubaisi. All rights reserved.
//

import UIKit

struct PizzaModel:Codable // pizza model confirms to cpdable protocol so we can decode the json into it easily
{
    let name:String
    let price:Double
}
