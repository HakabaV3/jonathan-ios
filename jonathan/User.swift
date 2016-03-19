//
//  User.swift
//  Jonathan
//
//  Created by Kikura Yuichiro on 2016/03/19.
//  Copyright © 2016年 hakaba. All rights reserved.
//

import APIKit
import Himotoki

struct User: Decodable {
    let id: String
    let name: String
    let created: Int32
    let updated: Int32
    let token: String?
    
    static func decode(e: Extractor) throws -> User {
        return try User(
            id: e <| ["result", "user", "id"],
            name: e <| ["result", "user", "name"],
            created: e <| ["result", "user", "created"],
            updated: e <| ["result", "user",  "updated"],
            token: e <|? ["result", "user",  "token"]
        )
    }
}