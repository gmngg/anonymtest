//
//  FulNoteViewModel.swift
//  anonymTestApp
//
//  Created by Malygin Georgii on 23.09.2020.
//

import Foundation

protocol MainViewModelInterface {
    var segmentContols: String? {get set}
    var showMassege: (() -> Void)? {get set}
    func getNewPost()
    func showFullPost(post: Items)
    func getModelView()
    func createItems(items: Items) -> (photoProfile: String, nameProfile: String, textPhotoItems: String, countComments: Int, countLikes: Int, photoItems: String, tagsItem: [String])
    var itemsView: [Items]? {get set}
    var updateView: (() -> Void)? {get set}
    
}

protocol MainViewModelOutput {
    func needModelFirst(orderBy: String?, success: ((JSONFile) -> Void)?, failure: ((Error) -> Void)?)
    func getNewPost(cursor: String?, orderBy: String?, success: ((JSONFile) -> Void)?, failure: ((Error) -> Void)?)
    func showFullPage(post: Items)
}

class MainViewModel: MainViewModelInterface {
    
    var segmentContols: String? = API.createdAt {
        didSet {
            self.getModelView()
        }
    }
    
    var showMassege: (() -> Void)?
    
    var JSONModel: JSONFile?
    func getNewPost() {
        output.getNewPost(cursor: JSONModel?.data?.cursor, orderBy: self.segmentContols, success: { [weak self] data in
            guard let appendArr = data.data?.items else {
                return
            }
            self?.itemsView?.append(contentsOf: appendArr)
            self?.JSONModel = data
        }, failure: { [weak self] error in
            self?.showMassege?()
        })
    }
    
    func showFullPost(post: Items) {
        output.showFullPage(post: post)
    }
    
    
    var updateView: (() -> Void)?
    
    var itemsView: [Items]? {
        didSet {
            self.updateView?()
        }
    }
    
    let output: MainViewModelOutput
    
    required init(container: Container) {
        output = container.output
    }
    
    func createItems(items: Items) -> (photoProfile: String, nameProfile: String, textPhotoItems: String, countComments: Int, countLikes: Int, photoItems: String, tagsItem: [String]) {
        var photoProfile: String = "pf"
        var nameProfile: String = "pf"
        var textPhotoItems: String = "pf"
        var countComments: Int = 0
        var countLikes: Int = 0
        var photoItems: String = "pf"
        var tagsItem: [String] = ["pf"]
        guard let post = items.contents else {
            return (photoProfile, nameProfile, textPhotoItems, countComments, countLikes, photoItems, tagsItem)
        }
        for i in 0 ... post.count - 1 {
            if post[i].type == "IMAGE" {
                if post[i].data?.small == nil {
                    photoItems = post[i].data?.extraSmall?.url ?? ""
                } else {
                    photoItems = post[i].data?.small?.url ?? ""
                }
            }
            if post[i].type == "TEXT" {
                textPhotoItems = post[i].data?.value ?? ""
            }
            if post[i].type == "TAGS" {
                tagsItem = post[i].data?.values ?? [""]
            }
        }
        nameProfile = items.author?.name ?? ""
        countComments = items.stats?.comments?.count ?? 0
        countLikes = items.stats?.likes?.count ?? 0
        
        guard let photoProf = items.author?.photo?.data else {
            return (photoProfile, nameProfile, textPhotoItems, countComments, countLikes, photoItems, tagsItem)
        }
        if photoProf.extraSmall?.url == nil {
            if photoProf.small?.url == nil {
                if photoProf.original?.url == nil {
                    if photoProf.medium?.url == nil {
                        photoProfile = ""
                    } else {
                        photoProfile = photoProf.medium?.url ?? ""
                    }
                } else {
                    photoProfile = photoProf.original?.url ?? ""
                }
            } else {
                photoProfile = photoProf.small?.url ?? ""
            }
        } else {
            photoProfile = photoProf.extraSmall?.url ?? ""
        }
        return (photoProfile, nameProfile, textPhotoItems, countComments, countLikes, photoItems, tagsItem)
    }
    
    func getModelView() {
        output.needModelFirst(orderBy: self.segmentContols, success: { [weak self] (itemsList) in
            self?.itemsView = itemsList.data?.items
            self?.JSONModel = itemsList
        }, failure: { [weak self] (erorr) in
            self?.showMassege?()
        })
    }
}

extension MainViewModel: Injectable {
    struct Container {
        let output: MainViewModelOutput
    }
}

