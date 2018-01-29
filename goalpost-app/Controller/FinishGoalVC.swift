//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by Иван Соколовский on 29.01.2018.
//  Copyright © 2018 iSOKOL-DEV. All rights reserved.
//

import UIKit
import CoreData

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
    
    func save(completion: @escaping (Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTxt.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            completion(true)
        } catch {
            debugPrint("Could not save \(error.localizedDescription)")
            completion(false)
        }
    }
    
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        guard pointsTxt.text != "", Int32(pointsTxt.text!)! > 0 else { return }
        save { (succes) in
            if succes {
                self.dismissDetail()
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
}
