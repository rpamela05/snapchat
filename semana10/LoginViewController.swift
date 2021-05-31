         //
//  LoginViewController.swift
//  semana10-A
//
//  Created by mbtec22 on 5/28/21.
//  Copyright © 2021 Tecsup.com. All rights reserved.
//

import UIKit
import FirebaseAuth
         
class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var userOrEmailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()

    }
    func setUpStyle(){
        loginButton.layer.cornerRadius = 6.0
        userOrEmailTextField.text = "karoline@gmail.com"
        passwordTextField.text = "karoline"
    }
    
    @IBAction func onClickBackbtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickLogin(_ sender: Any) {
        let user = userOrEmailTextField.text!
        let password = passwordTextField.text!
       
        Auth.auth().signIn(withEmail: user, password: password){
            (responseUser, error) in
            if error == nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                _ = UIAlertController(title: "Error", message: "User or Password incorrect", preferredStyle: .alert)
                _ = UIAlertAction(title: "ok", style: .default, handler: nil)
                print("todo mal")
            }
        }
       
        
    }
    
         }
