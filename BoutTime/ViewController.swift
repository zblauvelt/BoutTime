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

    @IBOutlet weak var firstEventLbl: UILabel!
    @IBOutlet weak var secondEventLbl: UILabel!
    @IBOutlet weak var thirdEventLbl: UILabel!
    @IBOutlet weak var fourthEventLbl: UILabel!
    
    var indexOfSelectedEvent = 0
    var previousNumber = GKRandomSource.sharedRandom().nextInt(upperBound: americanEvents.count)
    var usedIndex = [Int]()
    var roundEvents = [Int]()
    let numberOfEvents = 4
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayEvent()
       
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
        
        while roundEvents.count < numberOfEvents  {
            let index = randomNumer()
            roundEvents.append(index)
            print(roundEvents)
        }
            let firstEvent = roundEvents[0]
            let secondEvent = roundEvents[1]
            let thirdEvent = roundEvents[2]
            let fourthEvent = roundEvents[3]
            
            firstEventLbl.text = americanEvents[firstEvent].eventDescription
            secondEventLbl.text = americanEvents[secondEvent].eventDescription
            thirdEventLbl.text = americanEvents[thirdEvent].eventDescription
            fourthEventLbl.text = americanEvents[fourthEvent].eventDescription
    }
    



}




























