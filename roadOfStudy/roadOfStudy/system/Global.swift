//
//  Global.swift
//  roadOfStudy
//
//  Created by vincent on 15/4/2.
//  Copyright (c) 2015年 Fruit. All rights reserved.
//

import UIKit



// MARK: 日志相关

enum LogLevel:Int {
    case info   = 1
    case debug   = 4
    case error  = 7
}

let SYS_LOG_LEVEL:LogLevel = LogLevel.info

func logInfo(title:String, info:String){
    if SYS_LOG_LEVEL.rawValue >= LogLevel.info.rawValue {
        println("-- \(title)\n\(info)")
    }
}

func logDebug(title:String, info:String){
    if (SYS_LOG_LEVEL.rawValue >= LogLevel.debug.rawValue ) {
        println("== \(title)\n\(info)")
    }
}

func logError(title:String, info:String){
    if (SYS_LOG_LEVEL.rawValue >= LogLevel.error.rawValue){
        println("** \(title)\n\(info)")
    }
}


// MARK: 系统变量

let kScreen_Height  = UIScreen.mainScreen().bounds.height
let kScreen_Width   = UIScreen.mainScreen().bounds.width
let kScreen_Frame   = UIScreen.mainScreen().bounds

// MARK: 线程

func gcd_Main( doBlock: ()->Void){
    dispatch_async(dispatch_get_main_queue(),doBlock)
}


func gcd_Back(doBlock: ()->Void){
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        , doBlock)
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
        
        logInfo("resetSysInfo!","")
        
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
        
        logInfo("generate the device info","\(infoDic)")
        
        return infoDic;
    }
    
    


    
}
