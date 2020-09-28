//
//  FullNoteCoordinator.swift
//  anonymTestApp
//
//  Created by Malygin Georgii on 23.09.2020.
//

import Foundation

protocol MainCoordinatorInput {
    var output: MainCoordinatorOutput? {get set}
    var interactor: MainInteractorInput? { get set}
    func start()
}

protocol MainCoordinatorOutput {
    
}

class MainCoordinator: NSObject, MainCoordinatorInput {
    var interactor: MainInteractorInput?
    var output: MainCoordinatorOutput?
    var router: MainRouterInput?
    
    func start() {
        router?.routeToRoot()
    }
    func getJSONFirst(orderBy: String?, success: ((JSONFile) -> Void)?, failure: ((Error) -> Void)?) {
        guard let interactor = interactor else {
            return
        }
        let first = API.getTwentyPost
        var order: String?
        if orderBy == API.createdAt {
            order = API.createdAt
        }
        if orderBy == API.mostCommented {
            order = API.mostCommented
        }
        if orderBy == API.mostPopular {
            order = API.mostPopular
        }
        
        guard let orderStr = order else {
            return
        }
        
        interactor.getJSONModel(first: first, orderBy: orderStr, success: { data in
            success?(data)
        }, failure: { error in
            failure?(error)
        })
    }
    
    func newPost(cursor: String?, orderBy: String?, success: ((JSONFile) -> Void)?, failure: ((Error) -> Void)?) {
        guard let interactor = interactor, let curssor = cursor else {
            return
        }
        print(curssor)
        let first = API.getTwentyPost
        var order: String?
        if orderBy == API.createdAt {
            order = API.createdAt
        }
        if orderBy == API.mostCommented {
            order = API.mostCommented
        }
        if orderBy == API.mostPopular {
            order = API.mostPopular
        }
        
        guard let orderStr = order else {
            return
        }
        interactor.getNewItems(first: first,
                               after: curssor,
                               orderBy: orderStr,
                               success: { data in
                                success?(data)
                               }, failure: { error in
                                failure?(error)
                               })
    }
    
}

extension MainCoordinator: MainViewModelOutput {
    func showFullPage(post: Items) {
//        router.
    }
    
    func needModelFirst(orderBy: String?, success: ((JSONFile) -> Void)?, failure: ((Error) -> Void)?) {
        getJSONFirst(orderBy: orderBy, success: { data in
            success?(data)
        }, failure: { error in
            failure?(error)
        })
    }
    
    func getNewPost(cursor: String?, orderBy: String?, success: ((JSONFile) -> Void)?, failure: ((Error) -> Void)?) {
        newPost(cursor: cursor, orderBy: orderBy, success: { data in
            success?(data)
        }, failure: { error in
            failure?(error)
        })
    }
}
