//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by Иван Соколовский on 29.01.2018.
//  Copyright © 2018 iSOKOL-DEV. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {
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
        goalTxt.delegate = self
        addTap()
    }
    
    func addTap() {
        let tap = UITapGestureRecognizer(target: goalTxt, action: #selector(resignFirstResponder))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        guard let goalDescription = goalTxt.text, goalTxt.text != "What is your goal?", goalTxt.text != "" else { return }
        guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else { return }
        finishGoalVC.initData(goalDescription: goalDescription, goalType: goalType)
        presentingViewController?.presentSecondaryDetail(finishGoalVC)
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if goalTxt.text == "What is your goal?" {
            goalTxt.text = ""
            goalTxt.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if goalTxt.text == "" {
            goalTxt.text = "What is your goal?"
            goalTxt.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }
}
