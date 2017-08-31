//
//  ScoreController.swift
//  BoutTime
//
//  Created by Zachary Blauvelt on 8/29/17.
//  Copyright © 2017 ZackBlauvelt. All rights reserved.
//

import UIKit

class ScoreController: UIViewController {
    
    var totalScore: Int?

    @IBOutlet weak var scoreLbl: UILabel!
    
    @IBAction func playAgain(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToVC", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //scoreLbl.text = "\(String(describing: totalScore))/6)"
        if let finalScore = totalScore {
            scoreLbl.text = "\(finalScore)/6"
        } else{
            scoreLbl.text = "No Score"
        }
    }



}
