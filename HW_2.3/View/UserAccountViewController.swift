//
//  UserAccountViewController.swift
//  HW_2.3
//
//  Created by Maxim Mitin on 13.07.21.
//

import UIKit

class UserAccountViewController: UIViewController {
    @IBOutlet weak var welcomeLbl: UILabel!
    
    var usernameText = ""
    var passwordText = ""
    
    var welcomeName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLbl.text = welcomeName
    }
}
