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
    var submittedAnswerYears = [Any]()
    var correctAnswerYears = [Any]()
    let numberOfEvents = 4
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRound()
       
    }
    
    //MARK: Display Events
    func createRound() {
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
        displayRound()
        
    }
    
    //MARK: Arrange Events
    
    func moveEvents(fromIndex: Int, toIndex: Int) {
        let indexMove = roundEvents.remove(at: fromIndex)
        roundEvents.insert(indexMove, at: toIndex)
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            moveEvents(fromIndex: 0, toIndex: 1)
            displayRound()
        case 2:
            moveEvents(fromIndex: 1, toIndex: 0)
            displayRound()
        case 3:
            moveEvents(fromIndex: 1, toIndex: 2)
            displayRound()
        case 4:
            moveEvents(fromIndex: 2, toIndex: 1)
            displayRound()
        case 5:
            moveEvents(fromIndex: 2, toIndex: 3)
            displayRound()
        case 6:
            moveEvents(fromIndex: 3, toIndex: 2)
            displayRound()
        default:
            print("It didn't work")
        }
    }
    
    
    
    //MARK: Create Round
    
    func displayRound() {
        let firstEvent = roundEvents[0]
        let secondEvent = roundEvents[1]
        let thirdEvent = roundEvents[2]
        let fourthEvent = roundEvents[3]
        
        firstEventLbl.text = americanEvents[firstEvent].eventDescription
        secondEventLbl.text = americanEvents[secondEvent].eventDescription
        thirdEventLbl.text = americanEvents[thirdEvent].eventDescription
        fourthEventLbl.text = americanEvents[fourthEvent].eventDescription
        
        let submittedAnswerDict = [americanEvents[firstEvent].eventYear,
                                   americanEvents[secondEvent].eventYear,
                                   americanEvents[thirdEvent].eventYear,
                                   americanEvents[fourthEvent].eventYear]
        
        submittedAnswerYears.append(submittedAnswerDict)
    }
    
    
    //MARK: Check Answer
    
    /*func checkAnswer() {
        if submittedAnswerYears == submittedAnswerYears.sorted(by: <#(Any, Any) -> Bool#>) {
            print("true")
        } else {
            print("false")
        }
        
        }
*/


}




























