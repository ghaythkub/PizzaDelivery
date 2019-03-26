//
//  ViewController.swift
//  PizzaDelivery
//
//  Created by Ghayth Kubaisi on 3/24/19.
//  Copyright © 2019 Ghayth Kubaisi. All rights reserved.
//

import UIKit

class PizzaPickViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    // UI Elements
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var TotalPriceLabel: UILabel!  //the UI Label for total price
    var maxFlavorSelection = 1    // default the user can choose one flavor,the code is designed so quarters can be implemented easily
    var selectedFlavors:[PizzaModel] = []  // currently selected flavors
    var pizzas:[PizzaModel] = []   // the available pizzas from the Json File
    let PizzaUrlString = "https://static.mozio.com/mobile/tests/pizzas.json" //the pizza json file url in string format
    var totalPrice:Double = 0
    {
        didSet
        {
            TotalPriceLabel.text = "Your Total Price is : " + String(totalPrice) + " $"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let networking = networkingClient() // networking instance
        // get the json file from url and decode it into an array of pizza model
        networking.getJson(url: PizzaUrlString, mapItTo: pizzas, completion: { (data) in
            do {
                // try to decode the json file into array of pizza models , if can't ,print the error
                let pizzaData = try JSONDecoder().decode([PizzaModel].self, from: data!)
                //Get back to the main queue
                DispatchQueue.main.async {
                    self.pizzas = pizzaData  // set pizzas array to decodes array
                    self.tableView.reloadData() // reload table view to refresh the data
                }
            } catch let jsonError {
                print(jsonError) // print any errors
            }
        })
    }
    
    @IBAction func PizzaTypeSegmentToggled(_ sender: UISegmentedControl) {   // choose between one flavor or two halfs , the code is designed so quarters can be implemented easily
        switch sender.selectedSegmentIndex
        {
        case 0:
            PizzaType = "oneflavor"    // pizzaType made global so we can access it from all views  so we don't make private variable for each one, if the app is bigger we can take another approach
            maxFlavorSelection = 1  // one per pizza
        case 1:
            PizzaType = "twohalfs"
            maxFlavorSelection = 2  // two per pizza
        default:
            break
        }
        // reset variable when changing pizza type
        totalPrice = 0
        selectedFlavors = []
        tableView.reloadData()   
    }
    // when order confirmation pressed
    @IBAction func ConfirmMyOrderButtonTapped(_ sender: Any) {
        guard selectedFlavors.count == maxFlavorSelection  else {return} // make sure the numbers of selected flavors matches the pizza type.
        performSegue(withIdentifier: "ordersuccessful", sender: self) // move to order confirmation view
    }
   
}
// table HAndling stuff is moved to seperate file "PizzaPickViewControllerTableHandling" for cleaner code
