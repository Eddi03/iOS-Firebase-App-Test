//
//  RegistratiViewController.swift
//  iOSTest1
//
//  Created by Eddi Raimondi on 12/11/2018.
//  Copyright © 2018 Eddi. All rights reserved.
//

import UIKit

class RegistratiViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repeatPasswordField: UITextField!
    
    var email : String!
    var password : String!
    var repeatPassword : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        password = passwordField.text!
        repeatPassword = repeatPasswordField.text!
        
        guard password == repeatPassword else {
            self.present(GeneralUtils.share.alertError(title: "Errore", message: "Password Diverse"), animated: true, completion: nil)
            return
        }
        
        NetworkManager.signup(email: emailField.text!, password: passwordField.text!) { (success) in
            if success {
                debugPrint("CIAO BESTIE SONO DENTRO")
            }
            
            debugPrint("CIAO TROIE SONO FUORI")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
