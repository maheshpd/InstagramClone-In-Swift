//
//  SceneDelegate.swift
//  InstagramClone
//
//  Created by Mahesh Prasad on 17/08/19.
//  Copyright © 2019 Mahesh Prasad. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let tabBarDelegate = TabBarDelegate()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
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
              
        tabController.delegate = tabBarDelegate
        
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
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabController
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

