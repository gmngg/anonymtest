//
//  FullViewRouter.swift
//  anonymTestApp
//
//  Created by Malygin Georgii on 23.09.2020.
//

import UIKit

protocol MainRouterInput {
    func routeToRoot()
    
}

class MainRouter: NSObject, MainRouterInput {
    var navigaton: UINavigationController?
    private var assembly: MainAssembly
    var context: UIWindow?
    
    init(assembly: MainAssembly) {
        self.assembly = assembly
    }
    
    func routeToRoot() {
        let viewController = assembly.routeToRoot()
        let navi = UINavigationController(rootViewController: viewController)
        
        navigaton = navi
        
        context?.rootViewController = navi
        context?.makeKeyAndVisible()
    }
    func routeToFullItems(items: Items) {
        
    }
}
