//
//  AdminVO.swift
//  StudentRegistration
//
//  Created by Crisis Core on 11/30/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation

class AdminVO: NSObject {
    
    var id : String = UUID.init().uuidString
    
    var name : String? = nil
    
    var  email : String?  = nil
    
    public static func parsetToAdminVO (json : [String : Any]) -> AdminVO{
        let admin = AdminVO()
        admin.id = json["id"] as! String
        admin.name = json["name"] as? String
        admin.email = json["email"] as? String
        return admin
    }
    
    public static func parseToDictionary( admin : AdminVO) -> [String : Any] {
        let value = [
            "id" : admin.id ,
            "name" : admin.name ?? "" ,
            "email" : admin.email ?? ""
        ]
        
        return value
    }
    
}
