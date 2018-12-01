//
//  StudentVO.swift
//  StudentRegistration
//
//  Created by Crisis Core on 11/30/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation

class StudentVO: NSObject {
    
    var id : String? = UUID.init().uuidString
    
    var name : String? = nil
    
    var birthday : String? = nil
    
    var fatherName : String? = nil
    
    var gender  : Int? = nil
    
    var phone : String? = nil
    
    var email : String? = nil
    
    var address : String? = nil
    
    
    public static func parseToStudentVO(json : [String : Any]) -> StudentVO {
        let student = StudentVO()
        student.id = json["id"] as? String
        student.name = json["name"] as? String
        student.birthday = json["birthday"] as? String
        student.fatherName = json["fatherName"] as? String
        student.gender = json["gender"] as? Int
        student.phone = json["phone"] as? String
        student.email = json["email"] as? String
        student.address = json["address"] as? String
        return student
    }
    
    public static func parseToDictionary( studentVO : StudentVO) -> [String : Any] {
        let value = [
            "id" : studentVO.id ?? "" ,
            "name" : studentVO.name ?? "" ,
            "birthday" : studentVO.birthday ?? "" ,
            "fatherName" : studentVO.fatherName ?? "" ,
            "gender" : studentVO.gender ?? 0 ,
            "phone" : studentVO.phone ?? "" ,
            "email" : studentVO.email ?? "" ,
            "address" : studentVO.address ?? ""
            ] as [String : Any]
        return value
    }
    
}
