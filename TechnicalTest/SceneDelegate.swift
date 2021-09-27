//
//  SceneDelegate.swift
//  TechnicalTest
//
//  Created by Admin on 27/09/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        window =  UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        window?.rootViewController = viewController()
        window?.makeKeyAndVisible()
    }

    
    func viewController() -> UIViewController {
        let getNewsTopHeadlinesloader = GetNewsTopHeadlinesService(apiClient: URLSessionHttpClient())
        let viewController = GetNewsTopHeadlinesComposer.composedWith(getNewsTopHeadlinesLoader: getNewsTopHeadlinesloader)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.barTintColor = .white
        return navigationController
    }
    
}

