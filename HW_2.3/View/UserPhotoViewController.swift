//
//  UserPhotoViewController.swift
//  HW_2.3
//
//  Created by Maxim Mitin on 17.07.21.
//

import UIKit

class UserPhotoViewController: UIViewController {
    @IBOutlet weak var userPhoto: UIImageView!
    var userAccount: UserAccount?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPhoto.image = UIImage(named: userAccount?.person.photo ?? "")
    }


}
