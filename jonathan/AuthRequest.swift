//
//  AuthRequest.swift
//  Jonathan
//
//  Created by Kikura Yuichiro on 2016/03/19.
//  Copyright © 2016年 hakaba. All rights reserved.
//

import UIKit
import APIKit
import Himotoki

struct GetAuthMeRequest: JonathanRequestType {
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/auth/me"
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> User? {
        return try? decodeValue(object)
    }
}

struct PostAuthRequest: JonathanRequestType {
    let name: String
    let password: String
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
    
    var method: HTTPMethod {
        return .POST
    }
    
    var path: String {
        return "/auth"
    }
    
    var parameters: [String: AnyObject] {
        return [
            "name": name,
            "password": password
        ]
    }

    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> User? {
        return try? decodeValue(object)
    }
}