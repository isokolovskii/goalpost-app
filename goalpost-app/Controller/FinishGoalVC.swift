//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by Иван Соколовский on 29.01.2018.
//  Copyright © 2018 iSOKOL-DEV. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {
    // Outlets
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTxt: UITextField!
    
    private var goalDescription: String!
    private var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTxt.delegate = self
        addTap()
    }
    
    func addTap() {
        let tap = UITapGestureRecognizer(target: pointsTxt, action: #selector(resignFirstResponder))
        view.addGestureRecognizer(tap)
    }
    
    func initData(goalDescription description: String, goalType type: GoalType) {
        goalDescription = description
        goalType = type
    }
    
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
}
