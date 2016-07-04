    //
//  SinaAuthorizeHelper.swift
//  iPost
//
//  Created by Tyler.Yin on 16/7/2.
//  Copyright © 2016年 ayong. All rights reserved.
//

import Foundation


class SinaAuthorizeHelper:ThirdPlatformBaseObject {
    
    var completeHandle: RequestCompleteHandle?
    var userInfo: NSDictionary?
    
    override init() {
        super.init()
        AppDelegate.shareDelegate().weiboDelegate = self
    }
    
    deinit {
        if AppDelegate.shareDelegate().weiboDelegate == self {
            AppDelegate.shareDelegate().weiboDelegate = nil
        }
    }
    
    func authorize (completeHandle: RequestCompleteHandle?, userInfo: NSDictionary?) -> Void {
        self.completeHandle = completeHandle
        self.userInfo = userInfo
        let request = WBAuthorizeRequest.request() as! WBAuthorizeRequest
        request.redirectURI = kSinaAppRedirectURL
        request.scope = "all"
        WeiboSDK.sendRequest(request)
    }
    
    override func didReceiveWeiboResponse(response: WBBaseResponse) {
        if let resp = response as? WBAuthorizeResponse {
            if resp.userID != nil {
                let anAuthorizeInfo = AuthorizeInfo.init()
                anAuthorizeInfo.platform = .SinaWeibo
                anAuthorizeInfo.userID = resp.userID
                anAuthorizeInfo.accessToken = resp.accessToken
                anAuthorizeInfo.expirationDate = resp.expirationDate
                anAuthorizeInfo.refreshToken = resp.refreshToken
                
                AYUtility.saveModelByNSUserDefaultsWithObject(anAuthorizeInfo, key: kSinaAuthorizeInfo)
            }
        }
        if self.completeHandle != nil {
            self.completeHandle!(platform: Platform.SinaWeibo, response: response, userInfo: userInfo)
        }
        if AppDelegate.shareDelegate().weiboDelegate == self {
            AppDelegate.shareDelegate().weiboDelegate = nil
        }
    }
    
    
}
