//
//  APIClient.swift
//  Jonathan
//
//  Created by Kikura Yuichiro on 2016/03/19.
//  Copyright © 2016年 hakaba. All rights reserved.
//

import UIKit
import APIKit
import Result

typealias UserHandler = (Result<User, APIError>) -> Void

class APIClient: NSObject {
    static let sharedInstance = APIClient()
    var sessionToken: String?
    
    // MARK: - Auth
    
    func getAuthMe(handler: UserHandler) {
        Session.sendRequest(GetAuthMeRequest(), handler: handler)
    }
    
    func postAuth(name: String, password: String, handler: UserHandler) {
        Session.sendRequest(
            PostAuthRequest(name: name, password: password),
            handler: self.updateTokenWrapper(handler))
    }
    
    // MARK: - User
    
    func postUser(name: String, password: String, handler: UserHandler) {
        Session.sendRequest(
            PostUserRequest(name: name, password: password),
            handler: self.updateTokenWrapper(handler))
    }
    
    private func updateTokenWrapper(handler: UserHandler) -> UserHandler {
        return {(res) -> Void in
            switch res {
            case .Success(let user):
                self.sessionToken = user.token
                
            default:
                break
            }
            
            handler(res)
        }
    }
}

