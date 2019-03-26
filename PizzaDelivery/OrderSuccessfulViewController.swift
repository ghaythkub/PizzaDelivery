//
//  OrderSuccessfulViewController.swift
//  PizzaDelivery
//
//  Created by Ghayth Kubaisi on 3/26/19.
//  Copyright © 2019 Ghayth Kubaisi. All rights reserved.
//

import UIKit

class OrderSuccessfulViewController: UIViewController {
    var selectedPizza:[PizzaModel] = [] // selected flavors to set the summary
    var totalPrice:Double = 0
    // ui elements
    @IBOutlet weak var PizzaDetailsLabel: UILabel!
    @IBOutlet weak var PizzaPriceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // set the price according to selected flavors and pizza type
        PizzaPriceLabel.text = "Your Total Order Value is : " + String(totalPrice) + " $"
        switch PizzaType
    {
        case "oneflavor" :
            PizzaDetailsLabel.text = "Your Order is one pizza of " + selectedPizza.first!.name
        case "twohalfs"  :
            PizzaDetailsLabel.text = "Your Order is half of " + selectedPizza[0].name + " and half of " + selectedPizza[1].name + " Pizza."
        default:
            break
        }

    }

}
