//
//  LoginViewController.swift
//  FirebaseAuthentication
//
//  Created by Dwayne Johnson on 1/18/18.
//  Copyright © 2018 Dwayne Johnson. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSigninButton(_ sender: Any) {
        
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let alert = UIAlertController(title: "Error", message: "Please enter a valid username and password", preferredStyle: .alert)
        
//        guard let email = emailTextField.text, email != "",
//            let password = passwordTextField.text, password != ""
//            else {
//                UIAlertController.showAlert(self, title: "Missing info", message:"Please fill out all fields")
//                return
//        }
//
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if user != nil {
                print("User is logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("User login failed.")
                print("Error: \(error!.localizedDescription)")
                let defaultAction = UIAlertAction(title: "Try again", style: .default, handler: nil)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
