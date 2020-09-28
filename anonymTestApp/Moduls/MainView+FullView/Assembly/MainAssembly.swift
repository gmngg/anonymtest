//
//  FullNotAssemly.swift
//  anonymTestApp
//
//  Created by Malygin Georgii on 23.09.2020.
//

import UIKit

class MainAssembly {
    weak var interactorCash: MainInteractor?
    weak var coordinatorCash: MainCoordinator?
    weak var routerCash: MainRouter?
    
    lazy var interactor: MainInteractor = {
        guard let interactor = interactorCash else {
            let interactor = MainInteractor(
                container: MainInteractor.Container(
                    networkServise: NetworkData.networkData)
            )
            interactorCash = interactor
            return interactor
        }
        return interactor
    }()
    
    lazy var router: MainRouter = {
        guard let router = routerCash else {
            let router = MainRouter(assembly: self)
            
            routerCash = router
            return routerCash!
        }
        return router
    }()
    
    lazy var coordinator: MainCoordinator = {
        guard let coordinator = coordinatorCash else {
            let coordinator = MainCoordinator()
            coordinatorCash = coordinator
            return coordinatorCash!
        }
        return coordinator
    }()
    
    func coordinator(with context: UIWindow?) -> MainCoordinatorInput {
        let router = self.router
        router.context = context
        
        let coordinator = self.coordinator
        coordinator.router = router
        coordinator.interactor = interactor
        
        return coordinator
    }
    
    func routeToRoot() -> UIViewController {
        let viewModel = MainViewModel(
            container: MainViewModel.Container(
                output: coordinator)
        )
        
        let viewController = MainViewController(
            container: MainViewController.Container(
                viewModel: viewModel)
        )
        return viewController
    }
    
//    func fullNoteViewController(items: Items) -> UIViewController{
//        let viewModel = NewNoteViewModel(
//            container: NewNoteViewModel.Container(
//                interactor: interactor,
//                output: coordinator,
//                sessionId: sessionId)
//        )
//        
//        let viewController = NewNoteViewController(
//            container: NewNoteViewController.Container(
//                viewModel: viewModel)
//        )
//        return viewController
//    }
}
