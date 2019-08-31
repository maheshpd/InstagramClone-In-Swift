//
//  AppDelegate.swift
//  InstagramClone
//
//  Created by Mahesh Prasad on 17/08/19.
//  Copyright © 2019 Mahesh Prasad. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let tabController = UITabBarController()
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        
        let searchStoryboard = UIStoryboard(name: "Search", bundle: nil)
        
        let newPostStoryboard = UIStoryboard(name: "NewPost", bundle: nil)
        
        let ProfileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        
        let ActivityStoryboard = UIStoryboard(name: "Activity", bundle: nil)
        
        let homeVc = homeStoryboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        
        let searchVc = searchStoryboard.instantiateViewController(withIdentifier: "Search") as! SearchViewController
        
        let newPostVc = newPostStoryboard.instantiateViewController(withIdentifier: "NewPost") as! NewPostViewController
        
        let profileVc = ProfileStoryboard.instantiateViewController(withIdentifier: "Profile") as! ProfileViewController
        
        let activityVc = ActivityStoryboard.instantiateViewController(withIdentifier: "Activity") as! ActivityViewController
        
        let vcData: [(UIViewController,UIImage,UIImage)] = [
                (homeVc, UIImage(named: "Home")!,UIImage(named: "HomeSelected")!),
                (searchVc, UIImage(named: "Search")!,UIImage(named: "SearchSelected")!),
                (newPostVc, UIImage(named: "Post")!,UIImage(named: "Post")!),
                (activityVc, UIImage(named: "Activity")!,UIImage(named: "ActivitySelected")!),
                (profileVc, UIImage(named: "Profile")!,UIImage(named: "ProfileSelected")!),
               
        ]
        
        let vcs = vcData.map { (vc,defaultImage,selectedImage) -> UINavigationController in
            
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = defaultImage
            nav.tabBarItem.selectedImage = selectedImage
            return nav
        }
        
        tabController.viewControllers = vcs
        tabController.tabBar.isTranslucent = false
        
        if let items = tabController.tabBar.items {
            for item in items {
                if let image = item.image {
                    item.image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                }
                
                if let selectedImage = item.selectedImage {
                    item.selectedImage = selectedImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                }
                
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
                
            }
        }
        
        UINavigationBar.appearance().backgroundColor = UIColor.white
        window?.rootViewController = tabController
        
         return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

