//
//  UserRequestType.swift
//  Jonathan
//
//  Created by Kikura Yuichiro on 2016/03/19.
//  Copyright © 2016年 hakaba. All rights reserved.
//

import APIKit

protocol JonathanRequestType: RequestType {
}

extension JonathanRequestType {
    var baseURL: NSURL {
        return NSURL(string: "http://localhost:3000/api/v1")!
    }

    var requestBodyBuilder: RequestBodyBuilder {
        return .JSON(writingOptions: NSJSONWritingOptions.PrettyPrinted)
    }
    
    func configureURLRequest(URLRequest: NSMutableURLRequest) throws -> NSMutableURLRequest {
        if let sessionToken = APIClient.sharedInstance.sessionToken {
            URLRequest.setValue(sessionToken, forHTTPHeaderField: "X-Session-Token")
        }
        
        return URLRequest
    }
}