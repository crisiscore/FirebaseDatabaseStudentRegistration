//
//  ViewController.swift
//  StudentRegistration
//
//  Created by Crisis Core on 11/26/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if Auth.auth().currentUser == nil {
            let navController =   self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! UINavigationController
            
            self.present(navController , animated: true , completion: nil)
        }
    }

    @IBAction func registerAccount(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail: tfEmail.text!, password: tfPassword.text!) { (authResult, error) in
            if error != nil {
                print(error!)
            }
            
            guard (authResult?.user) != nil else { return }
            
           
              let navController =   self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! UINavigationController
                
                self.present(navController , animated: true , completion: nil)
                
        
        }
        
    }
    
}

