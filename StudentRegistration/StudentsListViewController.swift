//
//  StudentsListViewController.swift
//  StudentRegistration
//
//  Created by Crisis Core on 12/1/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import Firebase

class StudentsListViewController: UIViewController {

    @IBOutlet weak var studentsTableView: UITableView!
    
    var students : [StudentVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.studentsTableView.dataSource = self
        self.studentsTableView.delegate = self
        
        self.studentsTableView.register(UINib(nibName: "StudentTableViewCell", bundle: nil), forCellReuseIdentifier: "StudentTableViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getStudents()
    }
    
    func getStudents()  {
        
        Database.database().reference().child("students").observe(.value) { (dataSnapshot) in
            
            if let posts = dataSnapshot.children.allObjects as? [DataSnapshot]{
                
                var studentList  : [StudentVO] = []
                
                for post in posts {
                    
                   
                    if let value = post.value as? [String : AnyObject]{
                        studentList.append(StudentVO.parseToStudentVO(json: value))
                    }
                }
                
                self.students.removeAll()
                self.students.append(contentsOf: studentList)
                self.studentsTableView.reloadData()
                
            }
        }
        
    }

}

extension StudentsListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension StudentsListViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as! StudentTableViewCell
    
        let student = self.students[indexPath.row]
        
        cell.tfName.text = student.name
        cell.tfEmail.text = student.email
        cell.tfPhone.text = student.phone
        cell.tfAddress.text = student.address
        
        return cell
    }
    
    
}
