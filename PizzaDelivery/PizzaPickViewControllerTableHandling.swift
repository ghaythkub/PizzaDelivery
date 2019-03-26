//
//  PizzaPickViewControllerTableHandling.swift
//  PizzaDelivery
//
//  Created by Ghayth Kubaisi on 3/26/19.
//  Copyright © 2019 Ghayth Kubaisi. All rights reserved.
//

import UIKit


extension PizzaPickViewController
{
    // number of cells is the same of flavors available
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzas.count
    }
    // cell row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    // set each cell variable according to the coresponding pizza flavor
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pizzacell", for: indexPath) as! PizzaCell // reuse cells with provided prototype
        cell.Name = pizzas[indexPath.row].name
        cell.Price = pizzas[indexPath.row].price
        cell.cellIsSelected = false // on default or on reload the table, the cell is set to unselected
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! PizzaCell // get corresponding cell
        if (!cell.cellIsSelected && selectedFlavors.count < maxFlavorSelection) // if it is not selected and we can choose another flavor according to the pizza size then..
        {
            cell.cellIsSelected = true  // make it selected
            selectedFlavors.append(pizzas[indexPath.row]) // add it to the selected flavors
        }
        else if (cell.cellIsSelected)     // if it is selected
        {
            cell.cellIsSelected = false     //deselect it
            selectedFlavors
                = selectedFlavors.filter{ $0.name !=  pizzas[indexPath.row].name }  //remove it from the selected flavors
        }
         totalPrice = calculateTotalPrice(flavorsPrices: selectedFlavors.map({$0.price}), thePizzaType: PizzaType)  // change total price
    }
    // set the order successful view variables according to what have been chosen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let orderSuccessfulViewController = segue.destination as! OrderSuccessfulViewController
        orderSuccessfulViewController.totalPrice = totalPrice
        orderSuccessfulViewController.selectedPizza = selectedFlavors
    }

    
}
