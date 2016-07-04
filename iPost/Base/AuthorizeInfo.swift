//
//  AuthorizeInfo.swift
//  iPost
//
//  Created by Tyler.Yin on 16/7/2.
//  Copyright © 2016年 ayong. All rights reserved.
//

//import Cocoa

class AuthorizeInfo: NSObject, NSCoding {
    var platform : Platform?
    var userID : String?
    var accessToken : String?
    var expirationDate : NSDate?
    var refreshToken : String?
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInteger((self.platform?.rawValue)!, forKey: "platform")
        aCoder.encodeObject(userID, forKey: "userID")
        aCoder.encodeObject(accessToken, forKey: "accessToken")
        aCoder.encodeObject(expirationDate, forKey: "expirationDate")
        aCoder.encodeObject(refreshToken, forKey: "refreshToken")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()

        self.platform = Platform(rawValue: aDecoder.decodeIntegerForKey("platform"))
        self.userID = aDecoder.decodeObjectForKey("userID") as? String
        self.accessToken = aDecoder.decodeObjectForKey("accessToken") as? String
        self.expirationDate = aDecoder.decodeObjectForKey("expirationDate") as? NSDate
        self.refreshToken = aDecoder.decodeObjectForKey("refreshToken")as? String
    }
    
    override init() {
        super.init()
    }
    
}