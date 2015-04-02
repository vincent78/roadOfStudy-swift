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
class Global {
    
    // MARK: 单例的定义
    
    class func shareInstance()->Global{
        struct Singleton{
            static var predicate:dispatch_once_t = 0
            static var instance:Global? = nil
        }
        dispatch_once(&Singleton.predicate,{
                Singleton.instance = Global()
        })
        return Singleton.instance!
    }
    
    // MARK: 系统信息
    
    /// 内部保存的变量
    private var sysInfoTmp:String?
    
    var sysInfo : String {
        get {
                if (sysInfoTmp == nil){
                    sysInfoTmp = FTJsonUtil.toJSONString( getDeviceInfo() );
                }
                return sysInfoTmp!
        }
    }
    
    func resetSysInfo() {
        
        logInfo("--resetSysInfo!")
        
        sysInfoTmp = nil
    }
    
    
    
    /**
    获取设备的数据
    
    :returns: <#return value description#>
    */
    func getDeviceInfo() -> Dictionary<String,String> {
        var infoDic:Dictionary<String , String> = [:]
        //获取设备名称
        infoDic["name"] = UIDevice.currentDevice().name
        //获取设备系统名称
        infoDic["systemName"] = UIDevice.currentDevice().systemName
        //获取系统版本
        infoDic["systemVersion"] = UIDevice.currentDevice().systemVersion
        //获取设备模型
        infoDic["model"] = UIDevice.currentDevice().model
        //获取设备本地模型
        infoDic["localizedModel"] = UIDevice.currentDevice().localizedModel
        
        
        let mainBundleInfoDict = NSBundle.mainBundle().infoDictionary
        if let info = mainBundleInfoDict? {
            // app名称
            infoDic["CFBundleName"] = info["CFBundleName"] as String!
            // app版本
            infoDic["CFBundleShortVersionString"] = info["CFBundleShortVersionString"] as String!
            // app build版本
            infoDic["CFBundleVersion"] = info["CFBundleVersion"] as String!
        }
        
        //ip地址
        infoDic["IPAddr"] = GlobalOC.getIPAddress()
        
        logInfo("--generate the device info :\n\(infoDic)")
        
        return infoDic;
    }
    
    


    
}
