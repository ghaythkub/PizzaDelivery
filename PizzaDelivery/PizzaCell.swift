//
//  PizzaCell.swift
//  PizzaDelivery
//
//  Created by Ghayth Kubaisi on 3/26/19.
//  Copyright © 2019 Ghayth Kubaisi. All rights reserved.
//

import UIKit

class PizzaCell: UITableViewCell {
    // when the value of the flavor changes , we change the ui label accordingly
    var Name:String = ""
    {
        didSet
        {
            switch PizzaType
            {
            case "oneflavor":
                PizzaName.text = Name + " Pizza"
            case "twohalfs":
                PizzaName.text = "Half of " + Name + " Pizza"
            default:
                break
            }
        }
  
    }
    // when the value of the Price changes , we change the ui label accordingly
    var Price:Double = 0
    {
        didSet
        {
            switch PizzaType
            {
            case "oneflavor":
                PizzaPrice.text = "One whole pizza Price is : " + String(Price) + " $"            case "twohalfs":
                PizzaPrice.text = "Price of one half is : " + String(Price/2) + " $"
                self.Price = Price/2
            default:
                break
            }
        }
   
    }
    // change cell background color accoring to selection
    var cellIsSelected:Bool = false
    {
        didSet
        {
            if (cellIsSelected == true)
            {
                self.backgroundColor = UIColor.init(red: 255, green: 0, blue: 31)
            }
            else
            {
                self.backgroundColor = UIColor.init(red: 200, green: 171, blue: 0)
            }
        }
    }
    // UI Elements
    @IBOutlet weak var PizzaName: UILabel!
    @IBOutlet weak var PizzaPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
