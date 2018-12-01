//
//  StudentTableViewCell.swift
//  StudentRegistration
//
//  Created by Crisis Core on 12/1/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var tfName: UILabel!
    @IBOutlet weak var tfEmail: UILabel!
    @IBOutlet weak var tfPhone: UILabel!
    @IBOutlet weak var tfAddress: UILabel!
    var student : StudentVO? = nil
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
