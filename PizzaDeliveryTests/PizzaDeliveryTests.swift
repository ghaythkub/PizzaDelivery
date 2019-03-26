//
//  PizzaDeliveryTests.swift
//  PizzaDeliveryTests
//
//  Created by Ghayth Kubaisi on 3/26/19.
//  Copyright © 2019 Ghayth Kubaisi. All rights reserved.
//
import Foundation
import UIKit
import XCTest

@testable import PizzaDelivery
class PizzaDeliveryTests: XCTestCase {

    func testTotalPriceFunction()
    {
        let pizzaController = PizzaPickViewController()
        
        // test one flavor price
        XCTAssertEqual(15,pizzaController.calculateTotalPrice(flavorsPrices: [10,5], thePizzaType: "oneflavor"))
        
         // test two halfs price
         XCTAssertEqual(7.5,pizzaController.calculateTotalPrice(flavorsPrices: [10,5], thePizzaType: "twohalfs"))
        
    }
    
    func testJsonFetching()
        
    {
        let PizzaUrlString = "https://static.mozio.com/mobile/tests/pizzas.json"
        var Pizzas:[PizzaModel] = []
        let networking = networkingClient() // networking instance
        // get the json file from url and decode it into an array of pizza model
        let expectation = self.expectation(description: "Fetching Data") // make a hold to make sure the data is retrived
        networking.getJson(url: PizzaUrlString, mapItTo: Pizzas, completion: { (data) in
            do {
                // try to decode the json file into array of pizza models , if can't ,print the error
                let pizzaData = try JSONDecoder().decode([PizzaModel].self, from: data!)
                //Get back to the main queue
                DispatchQueue.main.async {
                    Pizzas = pizzaData  // set pizzas array to decodes array
                    expectation.fulfill() // continue testing after the data is retreived
                }
            } catch let jsonError {
                print(jsonError) // print any errors
            }
        })
 
        waitForExpectations(timeout: 5, handler: nil)
        //check if names fetched correctly
       XCTAssertEqual(Pizzas[0].name, "Mozzarella")
        
        //check if prices fetched correctly
        XCTAssertEqual(Pizzas[0].price, 10)
        
        //check we have no extra items
        XCTAssertEqual(Pizzas.count, 4)
        
    }

}
