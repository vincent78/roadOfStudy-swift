//
//  MDSplitViewController.swift
//  roadOfStudy
//
//  Created by vincent on 15/3/30.
//  Copyright (c) 2015年 Fruit. All rights reserved.
//

import UIKit

class MDSplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if let viewControllers = self.navigationController?.viewControllers
        {
//            NSLog("the viewControlls %@", viewControllers)
            
            logWarn("the viewControlls \(viewControllers)")
        }
        
        NSLog("the viewControlls %@", self.viewControllers)

        
        if let primaryNavigationController = self.viewControllers[0] as? UINavigationController
        {
            NSLog("the primaryNavigationController's view :%@",primaryNavigationController.viewControllers)
            
            if let masterViewController = primaryNavigationController.topViewController as? MasterViewController
            {
                masterViewController.navigationItem.leftBarButtonItem = self.displayModeButtonItem()

            }
            

        }
       

        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        

        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    func MDSplitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController!, ontoPrimaryViewController primaryViewController:UIViewController!) -> Bool {
//        if let secondaryAsNavController = secondaryViewController as? UINavigationController {
//            if let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController {
//                if topAsDetailController.detailItem == nil {
//                    // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
//                    return true
//                }
//            }
//        }
//        return false
//    }
    
    

}
