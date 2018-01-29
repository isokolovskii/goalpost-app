//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by Иван Соколовский on 29.01.2018.
//  Copyright © 2018 iSOKOL-DEV. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    // Outlets
    @IBOutlet weak var goalTxt: UITextView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
    }
    
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        goalType = .shortTerm
    }
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
        goalType = .longTerm
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
}
