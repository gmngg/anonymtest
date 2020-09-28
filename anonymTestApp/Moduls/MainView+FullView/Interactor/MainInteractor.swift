//
//  FullNoteInteractor.swift
//  anonymTestApp
//
//  Created by Malygin Georgii on 23.09.2020.
//

import Foundation

protocol MainInteractorInput {
    func getJSONModel(first: String, orderBy: String, success: ((JSONFile) -> Void)?, failure: ((Error) -> Void)?)
    func getNewItems(first: String, after: String, orderBy: String, success: ((JSONFile) -> Void)?, failure: ((Error) -> Void)?)
}

protocol MainInteractorOutput {
    
}

class MainInteractor: Injectable {
    let networkServise: NetworkDataProtocol
    
    required init(container: Container) {
        networkServise = container.networkServise
    }
}
extension MainInteractor {
    struct  Container {
        let networkServise: NetworkDataProtocol
    }
}

extension MainInteractor: MainInteractorInput {
    func getJSONModel(first: String, orderBy: String, success: ((JSONFile) -> Void)?, failure: ((Error) -> Void)?) {
        networkServise.getItems(first: first, orderBy: orderBy, completion: { (respons) in
            switch respons {
            case .success(let data):
                guard let strData = data else {
                    return
                }
                success?(strData)
            case .failure(let error):
                failure?(error)
            }
        })
    }
    
    func getNewItems(first: String, after: String, orderBy: String, success: ((JSONFile) -> Void)?, failure: ((Error) -> Void)?) {
        networkServise.getNewItems(first: first, after: after, orderBy: orderBy, completion: { (response) in
            switch response {
            case .success(let data):
                guard let strData = data else {
                    return
                }
                success?(strData)
            case .failure(let error):
                failure?(error)
            }
        })
    }
}
