//
//  SinaWeiboHelper.swift
//  iPost
//
//  Created by Tyler.Yin on 16/7/2.
//  Copyright © 2016年 ayong. All rights reserved.
//


class SinaWeiboHelper: ThirdPlatformBaseObject {

}

class SinaWeiboGetHelper: SinaWeiboHelper {
    /**
     返回最新的公共微博
     
     - parameter page:           单页返回的记录条数，默认为50。
     - parameter pageCount:      返回结果的页码，默认为1。
     - parameter baseApp:        是否只获取当前应用的数据。0为否（所有数据），1为是（仅当前应用），默认为0。
     - parameter otherParams:    扩展参数
     - parameter completeHandle: 请求完成后回调
     - 另外还有一个参数：access_token(采用OAuth授权方式为必填参数，OAuth授权后获得。)，这个参数直接从plist文件中读取，不用传递
     */
    func getPublicTimeline(page: NSNumber?, pageCount: NSNumber?, baseApp: NSNumber?, otherParams: [NSObject:AnyObject]?, completeHandle: RequestCompleteHandle?) {
        let authorizeInfo = AYUtility.getModelByNSUserDefaultsForKey(kSinaAuthorizeInfo) as? AuthorizeInfo
        var accessToken: String?
        if authorizeInfo?.userID != nil {//TODO: 没有授权或者token过期、无效，都需要重新授权， 后期补充
        }
        accessToken = authorizeInfo?.accessToken
        if accessToken == nil || accessToken?.characters.count==0 {
            accessToken = ""
        }
        var url = "https://api.weibo.com/2/statuses/public_timeline.json?access_token=\(accessToken!)"
        if page != nil {
            url += "&page=\(page!)"
        }
        if pageCount != nil {
            url += "&count=\(pageCount!)"
        }
        if baseApp != nil {
            url += "&base_app=\(baseApp!)"
        }
        print("返回最新的公共微博 开始请求")
        
        WBHttpRequest.init(accessToken: accessToken, url: url, httpMethod: "GET", params: nil, queue: nil) { (aWBHttpRequest, aAnyObject, aNSError) in
            print("aaaaa")
            if aNSError != nil {
                NSLog("%@", aNSError)
            }
            if completeHandle != nil {
                completeHandle!(platform:Platform.SinaWeibo, response: aAnyObject, userInfo:nil)
            }
        }
        
        
    }
}


class SinaWeiboPostHelper: SinaWeiboHelper {
    
}
