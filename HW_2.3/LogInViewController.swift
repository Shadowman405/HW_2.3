//
//  ViewController.swift
//  HW_2.3
//
//  Created by Maxim Mitin on 13.07.21.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    //TestAcc
    var testUser = User(name: "User", password: "111111")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameTxtField.delegate = self
        self.passwordTxtField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
// segue to userAcc VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userAccountVC =
                segue.destination as? UserAccountViewController
        else {return}
        userAccountVC.welcomeName = "Welcome , \(testUser.name) !"
    }
    
// unwind segue
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let userAccountVC =
                segue.source as? UserAccountViewController
        else {return}
        usernameTxtField.text = userAccountVC.usernameText
        passwordTxtField.text = userAccountVC.usernameText
    }
// switch between TxtFields
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchNextTxtField(textField)
        return true
    }
    
    private func switchNextTxtField(_ textfield: UITextField){
        switch textfield {
        case self.usernameTxtField:
            self.passwordTxtField.becomeFirstResponder()
        default:
            self.passwordTxtField.resignFirstResponder()
        }
    }
    
// MARK: Login Button logics
    @IBAction func loginBtnClicked() {
        if usernameTxtField.text != testUser.name {
            let alert = UIAlertController(
                title: "Wrong Username",
                message: "Please check your username",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: .none))
            self.present(alert, animated: true, completion: nil)
        } else if passwordTxtField.text != testUser.password {
            let alert = UIAlertController(
                title: "Wrong Password",
                message: "Please check your password",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: .none))
            self.present(alert, animated: true, completion: nil)
        } else {
            return
        }
    }
// MARK: Reminders
    @IBAction func usrnameReminderClicked() {
        let alert = UIAlertController(
            title: "Username Reminder",
            message: "Your username \(testUser.name)",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: .none))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func passwordReminderClicked() {
        let alert = UIAlertController(
            title: "Password Reminder",
            message: "Your password \(testUser.password)",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: .none))
        self.present(alert, animated: true, completion: nil)
    }
    
}

// MARK: User class extension
extension LogInViewController {
    class User {
        var name: String
        var password: String
        
        init(name: String, password: String){
            self.name = name
            self.password = password
        }
    }
}
