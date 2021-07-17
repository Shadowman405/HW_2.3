//
//  UserInfoViewController.swift
//  HW_2.3
//
//  Created by Maxim Mitin on 17.07.21.
//

import UIKit

class UserInfoViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    var userInfo = ""
    
    override func viewDidLoad() {
        infoLabel.text = userInfo
        super.viewDidLoad()

    }

}
