//
//  ViewController.swift
//  BoutTime
//
//  Created by Zachary Blauvelt on 8/22/17.
//  Copyright © 2017 ZackBlauvelt. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {

    var indexOfSelectedEvent = 0
    var previousNumber = GKRandomSource.sharedRandom().nextInt(upperBound: americanEvents.count)
    var usedIndex = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    //MARK: Display Events
    func displayEvent() {
        func randomNumer() -> Int {
            indexOfSelectedEvent = GKRandomSource.sharedRandom().nextInt(upperBound: americanEvents.count)
            while usedIndex.contains(indexOfSelectedEvent) {
                indexOfSelectedEvent = GKRandomSource.sharedRandom().nextInt(upperBound: americanEvents.count)
            }
            previousNumber = indexOfSelectedEvent
            usedIndex.append(previousNumber)
            
            return indexOfSelectedEvent
        }
        indexOfSelectedEvent = randomNumer()
    }
    



}




























