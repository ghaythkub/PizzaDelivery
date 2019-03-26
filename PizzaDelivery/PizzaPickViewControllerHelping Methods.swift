//
//  PizzaPickViewControllerHelping Methods.swift
//  PizzaDelivery
//
//  Created by Ghayth Kubaisi on 3/26/19.
//  Copyright © 2019 Ghayth Kubaisi. All rights reserved.
//

import UIKit
extension PizzaPickViewController
{
    // calculate total price of the order
     func calculateTotalPrice(flavorsPrices:[Double] ,thePizzaType : String ) -> Double
    {
        guard flavorsPrices.count > 0 else {return 0} // make sure something is selected
        var totalPrice:Double = 0
        for price in flavorsPrices  // the code is ready for quarters or any othe split
        {
            totalPrice += price
        }
        switch thePizzaType {
        case "oneflavor":
            return totalPrice
        case "twohalfs":
            return (totalPrice/2)
        default:
            return totalPrice
        }
        
    }
}

