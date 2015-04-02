//
//  Global.swift
//  roadOfStudy
//
//  Created by vincent on 15/4/2.
//  Copyright (c) 2015年 Fruit. All rights reserved.
//

import UIKit

/**
打印出log信息

:param: info <#info description#>
*/




enum LogLevel:Int {
    case info   = 1
    case warn   = 4
    case error  = 7
}

let SYS_LOG_LEVEL:LogLevel = LogLevel.info

func logInfo(info:String){
    if SYS_LOG_LEVEL.rawValue >= LogLevel.info.rawValue {
        println(info)
    }
}

func logWarn(info:String){
    if (SYS_LOG_LEVEL.rawValue >= LogLevel.warn.rawValue ) {
        println(info)
    }
}

func logError(info:String){
    if (SYS_LOG_LEVEL.rawValue >= LogLevel.error.rawValue){
        println(info)
    }
}





/**
*  @brief  本地相关的单例
*/
class Global: NSObject {
    
    // MARK: 单例的定义
    /**
    单例
    
    :returns: Global的实例
    */
    class func shareInstance()->Global{
        struct UKSingleton{
            static var predicate:dispatch_once_t = 0
            static var instance:Global? = nil
        }
        dispatch_once(&UKSingleton.predicate,{
                UKSingleton.instance=Global()
        })
        return UKSingleton.instance!
    }
    
    // MARK:
    
    
}
