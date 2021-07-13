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
        
        //Done button toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(loginBtnClicked))
        toolBar.setItems([doneButton], animated: false)
        passwordTxtField.inputAccessoryView = toolBar
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
            alertWindowAppear(title: "Wrong Username", message: "Please check your username")
        } else if passwordTxtField.text != testUser.password {
            alertWindowAppear(title: "Wrong Password", message: "Please check your password")
        } else {
            performSegue(withIdentifier: "toUserAccount", sender: nil)
        }
    }
// MARK: Reminders
    @IBAction func usrnameReminderClicked() {
        alertWindowAppear(title: "Username Reminder",
                    message: "Your username \(testUser.name)")
    }
    
    @IBAction func passwordReminderClicked() {
        alertWindowAppear(title: "Password Reminder",
                    message: "Your password \(testUser.password)")
    }
    
    func alertWindowAppear (title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
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
