//
//  AppDelegate.swift
//  KanyeQuotes
//
//  Created by Michael Horn on 5/10/19.
//  Copyright © 2019 Mike Horn. All rights reserved.
//

import UIKit

//TODO: Import Branch

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Branch.getInstance().initSession(launchOptions: launchOptions) { (params, error) in
            print(params as? [String: AnyObject] ?? {})
            
            // TODO: add clicked branch link
            
            // TODO: wrap in conditional:
                let storyboard = UIStoryboard(name: "Main", bundle: nil);
                let quoteViewController: QuoteViewController = storyboard.instantiateViewController(withIdentifier: "QuoteViewController") as! QuoteViewController;
                let quote = params?["quote"] as! String?
                if let unwrappedQuote = quote {
                    quoteViewController.quote = unwrappedQuote
            // TODO: close conditional!
                
                let rootViewController = self.window!.rootViewController as! UINavigationController;
                rootViewController.pushViewController(quoteViewController, animated: true);
            }
            
        }
        return true
    }
    
    //TODO: openURL and continueUserActivity

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

