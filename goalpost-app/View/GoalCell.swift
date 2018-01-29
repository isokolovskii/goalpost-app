//
//  GoalCell.swift
//  goalpost-app
//
//  Created by Иван Соколовский on 29.01.2018.
//  Copyright © 2018 iSOKOL-DEV. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    // Outlets
    @IBOutlet weak var goalDecriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    func configureCell(goalDescription description: String, goalType type: GoalType, goalProgressAmount progress: Int) {
        goalDecriptionLbl.text = description
        goalTypeLbl.text = type.rawValue
        goalProgressLbl.text = "\(progress)"
    }
}
