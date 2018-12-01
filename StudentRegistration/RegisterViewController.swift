//
//  RegisterViewController.swift
//  StudentRegistration
//
//  Created by Crisis Core on 11/28/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfBirthday: UITextField!
    
    @IBOutlet weak var tfFatherName: UITextField!
    
    @IBOutlet weak var scGender: UISegmentedControl!
    
    @IBOutlet weak var tfPhone: UITextField!
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfAddress: UITextField!
    
    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()

    }


    @IBAction func onClickRegister(_ sender: UIButton) {
        
        let student = StudentVO()
        student.name = tfName.text
        student.birthday = tfBirthday.text
        student.fatherName = tfFatherName.text
        student.gender = scGender.selectedSegmentIndex
        student.phone  = tfPhone.text
        student.email = tfEmail.text
        student.address  = tfAddress.text
        
        ref.child("students").child(student.id!).setValue(StudentVO.parseToDictionary(studentVO: student))
        
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "StudentsListViewController") as! UINavigationController
        
        self.present(nav , animated: true , completion: nil)
        
    }
}

