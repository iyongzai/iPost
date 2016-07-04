//
//  AYUtility.swift
//  iPost
//
//  Created by Tyler.Yin on 16/7/2.
//  Copyright © 2016年 ayong. All rights reserved.
//


class AYUtility {
    
    //封装NSUserDefault
    /**
     *  保存一个对象--------NSUserDefault
     *
     *  @param obj obj
     *  @param key key
     */
    class func saveModelByNSUserDefaultsWithObject(obj: NSObject?, key: String!) -> Void {
        if (obj==nil)
        {
            NSLog("保存的对象为nil key:\(key)");
            return;
        }
        let data = NSKeyedArchiver.archivedDataWithRootObject(obj!)
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    /**
     *  删除一个对象--------NSUserDefault
     *
     *  @param key key
     */
    class func removeModelByNSUserDefaultsForKey(key: String!) -> Void {
        if NSUserDefaults.standardUserDefaults().objectForKey(key) != nil {
            NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    /**
     *  获取一个对象-------NSUserDefault
     *
     *  @param key key
     *
     *  @return 返回plist中存储的对象
     */
    class func getModelByNSUserDefaultsForKey(key: String!) -> NSObject? {
        let data = NSUserDefaults.standardUserDefaults().objectForKey(key) as? NSData
        if (data == nil) {
            return nil;
        }
        let obj = NSKeyedUnarchiver.unarchiveObjectWithData(data!) as? NSObject
        return obj;
    }


}
