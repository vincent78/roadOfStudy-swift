//
//  FTJsonUtil.swift
//  roadOfStudy
//
//  Created by vincent on 15/4/2.
//  Copyright (c) 2015年 Fruit. All rights reserved.
//

import UIKit

class FTJsonUtil
{
    // MARK: 单例的定义
    
    class func shareInstance()->FTJsonUtil{
        struct UKSingleton{
            static var predicate:dispatch_once_t = 0
            static var instance:FTJsonUtil? = nil
        }
        dispatch_once(&UKSingleton.predicate,{
            UKSingleton.instance=FTJsonUtil()
        })
        return UKSingleton.instance!
    }
    
    
    // MARK: 对象转JSON字符串
    
    class func toJSONString(dict:NSDictionary!)->NSString{
        
        var data = NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.PrettyPrinted, error: nil)
        var strJson=NSString(data: data!, encoding: NSUTF8StringEncoding)
        return strJson!
    }

}
