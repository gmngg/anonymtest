//
//  API.swift
//  anonymTestApp
//
//  Created by Malygin Georgii on 22.09.2020.
//

import Foundation

struct API {
    static let scheme = "http"
    static let host = "stage.apianon.ru"
    static let port = 3000
    static let path = "/fs-posts/v1/posts"
    
    static let first = "first"
    static let after = "after"
    static let orderBy = "orderBy"
    
    static let mostPopular = "mostPopular"
    static let mostCommented = "mostCommented"
    static let createdAt = "createdAt"
    
    static let getFivePost = "5"
    static let getTenPost = "10"
    static let getTwentyPost = "20"
}

