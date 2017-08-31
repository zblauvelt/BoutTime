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
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {}
    @IBOutlet weak var timerOutlet: UILabel!
    
    var indexOfSelectedEvent = 0
    var previousNumber = GKRandomSource.sharedRandom().nextInt(upperBound: americanEvents.count)
    var usedIndex = [Int]()
    var roundEvents = [Int]()
    var submittedAnswerYears = [Int]()
    let numberOfEvents = 4
    let numberOfRounds = 6
    var round = 1
    var score = 0
    var seconds = 60
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRound()
        checkAnswer()
        runTimer()
        
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showScore"{
            if let scoreController = segue.destination as? ScoreController {
                scoreController.totalScore = score
            }
        }
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
        
        submittedAnswerYears.removeAll()
        
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
            checkAnswer()
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
        
        
        for roundIndex in roundEvents {
            submittedAnswerYears.append(americanEvents[roundIndex].eventYear)
        }
        
        print("ZACK: Submitted Answer \(submittedAnswerYears)")    }
    
    
    //MARK: Check Answer
    
    func checkAnswer() {
        let correctAnswer = submittedAnswerYears.sorted { (left: Int, right: Int) -> Bool in
            left < right
        }
        
        print("ZACK: Correct Answer \(correctAnswer)")
        
        if submittedAnswerYears == correctAnswer {
            
            score += 1
            print("ZACK: Answer is Correct Score is \(score)")
            
        } else {
            print("ZACK: Answer is Incorrect")
        }
    }
    
    //MARK: Update Round
    
    func updateRound() {
        switch round {
        case  1...5:
            checkAnswer()
            round += 1
            print("ZACK: Round: \(round)")
            usedIndex.removeAll()
            roundEvents.removeAll()
            submittedAnswerYears.removeAll()
            createRound()
        default:
            print("round 6")
            usedIndex.removeAll()
            roundEvents.removeAll()
            submittedAnswerYears.removeAll()
            createRound()
            performSegue(withIdentifier: "showScore", sender: nil)
            
            round = 1
            score = 0
        }
        
    }
    
    //MARK: Shake Gesture
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            updateRound()
        }
    }
    
    //MARK: Timer
    
    func updateTimer() {
        
        if seconds < 1 {
            timer.invalidate()
        } else {
        seconds -= 1
        timerOutlet.text = "\(seconds)"
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @IBAction func nextRound(_ sender: Any) {
        updateRound()
    }

    
    
}




























