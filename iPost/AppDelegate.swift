//
//  AppDelegate.swift
//  iPost
//
//  Created by Tyler.Yin on 16/7/1.
//  Copyright © 2016年 ayong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WeiboSDKDelegate {
    
    var window: UIWindow?
    var weiboDelegate: ThirdPlatformBaseObject?

    class func shareDelegate()-> AppDelegate {
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        #if DEBUG
            WeiboSDK.enableDebugMode(true)
        #else
            WeiboSDK.enableDebugMode(false)
        #endif
        WeiboSDK.registerApp(kSinaAppKey)
        return true
    }
    
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        
        return WeiboSDK.handleOpenURL(url, delegate: self)
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        return WeiboSDK.handleOpenURL(url, delegate: self)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    /**
    收到一个来自微博客户端程序的请求
    
    收到微博的请求后，第三方应用应该按照请求类型进行处理，处理完后必须通过 [WeiboSDK sendResponse:] 将结果回传给微博
    @param request 具体的请求对象
    */
    func didReceiveWeiboRequest(request: WBBaseRequest!) {
        if self.weiboDelegate != nil {
            self.weiboDelegate?.didReceiveWeiboRequest(request)
        }
    }
    /**
    收到一个来自微博客户端程序的响应
    
    收到微博的响应后，第三方应用可以通过响应类型、响应的数据和 WBBaseResponse.userInfo 中的数据完成自己的功能
    @param response 具体的响应对象
    */
    func didReceiveWeiboResponse(response: WBBaseResponse!) {
        if self.weiboDelegate != nil {
            self.weiboDelegate?.didReceiveWeiboResponse(response)
        }
    }

}

