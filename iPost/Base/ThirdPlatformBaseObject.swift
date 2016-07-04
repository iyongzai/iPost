//
//  ThirdPlatformBaseObject.swift
//  iPost
//
//  Created by Tyler.Yin on 16/7/2.
//  Copyright © 2016年 ayong. All rights reserved.
//

import Foundation


enum Platform: Int {
    case SinaWeibo   = 1
    
    func simpleDescription()->String {
        switch self {
        case .SinaWeibo:
            return "SinaWeibo"
        }
    }
}

typealias RequestCompleteHandle = (platform:Platform, response: AnyObject?, userInfo: NSDictionary?)->Void



//MARK: 新浪微博相关代码
class ThirdPlatformBaseObject:NSObject,WeiboSDKDelegate {
    /**
     收到一个来自微博客户端程序的请求
     
     收到微博的请求后，第三方应用应该按照请求类型进行处理，处理完后必须通过 [WeiboSDK sendResponse:] 将结果回传给微博
     @param request 具体的请求对象
     */
    func didReceiveWeiboRequest(request: WBBaseRequest!) {
        
    }
    /**
     收到一个来自微博客户端程序的响应
     
     收到微博的响应后，第三方应用可以通过响应类型、响应的数据和 WBBaseResponse.userInfo 中的数据完成自己的功能
     @param response 具体的响应对象
     */
    func didReceiveWeiboResponse(response: WBBaseResponse!) {
        
    }

}