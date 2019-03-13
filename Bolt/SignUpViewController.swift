//
//  SignUpViewController.swift
//  Bolt
//
//  Created by Valaczkai, David on 12/03/2019.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Outlets
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        email.delegate = self
        password.delegate = self
        passwordConfirm.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    @IBAction func signUpAction(_ sender: Any) {
            if self.password.text != self.passwordConfirm.text {
                let alertController = UIAlertController(title: "Passwords Incorrect", message: "Passwords do not match!", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else {
                Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
                    if error == nil {
                        self.performSegue(withIdentifier: "signupToHome", sender: self)
                    }
                    else {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                    
            }
        }
        
    }
}
