//
//  UserInfoViewController.swift
//  HW_2.3
//
//  Created by Maxim Mitin on 17.07.21.
//

import UIKit

class UserInfoViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    var userInfo: UserAccount?
    
    override func viewDidLoad() {
        infoLabel.text = userInfo?.info
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else {return}
        guard let userPhotoVC = navigationVC.topViewController as? UserPhotoViewController else {return}
        userPhotoVC.userAccount = userInfo
    }

}
