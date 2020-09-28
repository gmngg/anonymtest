//
//  ItemsData.swift
//  anonymTestApp
//
//  Created by Malygin Georgii on 23.09.2020.
//

import Foundation

struct JSONFile: Codable {
    let data: ItemsData?
    let errors: String?
    
    enum CodingKeys: String, CodingKey  {
        case data
        case errors = "errors"
    }
}

struct ItemsData: Codable {
    let items: [Items]?
    let cursor: String?
    
    enum CodingKeys: String, CodingKey  {
        case items
        case cursor = "cursor"
    }
}

struct Items: Codable {
    let id : String?
    let type:  String?
    let status: String?
    let coordinates: Coordinate?
    let isCommentable: Bool?
    let hasAdultContent: Bool?
    let isAuthorHidden: Bool?
    let isHiddenInProfile: Bool?
    let contents: [Content]?
    let language: String?
    let awards: AwardsItems?
    let createdAt: Int?
    let updatedAt: Int?
    let author: AuthorData?
    let stats: StatsData?
    let isMyFavorite: Bool?
    
    enum CodingKeys: String, CodingKey  {
        case id = "id"
        case type = "type"
        case status = "status"
        case coordinates = "cooedinates"
        case isCommentable = "isCommentable"
        case hasAdultContent = "hasAdultContent"
        case isAuthorHidden = "isAuthorHudden"
        case isHiddenInProfile = "isHiddenInProfile"
        case contents
        case language = "language"
        case awards = "awards"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case author = "author"
        case stats = "stats"
        case isMyFavorite = "isMyFavorite"
    }
}

struct Coordinate: Codable {
    let latitude: Double?
    let longitude: Double?
    
    enum CodingKeys: String, CodingKey  {
        case latitude = "latitude"
        case longitude = "longitude"
    }
}

struct Content: Codable {
    let type: String?
    let id: String?
    let data: ContentItems?
    
    enum CodingKeys: String, CodingKey  {
        case type = "type"
        case id = "id"
        case data = "data"
    }
}

struct ContentItems: Codable {
    let extraSmall: ImageData?
    let small: ImageData?
    let medium: ImageData?
    let original: ImageData?
    
    let value: String?
    let values: [String]?
    
    enum CodingKeys: String, CodingKey  {
        case extraSmall = "extraSmalle"
        case small = "small"
        case medium = "medium"
        case original = "original"
        case value = "value"
        case values = "values"
    }
}

struct ImageData: Codable {
    let url: String?
    let size: SizeImage?
    
    enum CodingKeys: String, CodingKey  {
        case url = "url"
        case size = "size"
    }
}

struct SizeImage: Codable {
    let width: Int?
    let height: Int?
    
    enum CodingKeys: String, CodingKey  {
        case width = "width"
        case height = "height"
    }
}

struct AwardsItems: Codable {
    let voices: Int?
    let awardedByMe: Bool?
    
    
    enum CodingKeys: String, CodingKey  {
        case voices = "voices"
        case awardedByMe = "awardedByMe"
    }
    
}

struct AuthorData: Codable {
    let id: String?
    let url: String?
    let name: String?
    let banner: ContentItems?
    let photo: Content?
    let gender: String?
    let isHidden: Bool?
    let isBlocked : Bool?
    let isMessagingAllowed: Bool?
    let auth: AuthData?
    let statistics: StaticsData?
    let tagline: String?
    
    
    enum CodingKeys: String, CodingKey  {
        case id = "id"
        case url = "url"
        case name = "name"
        case banner = "banner"
        case photo = "photo"
        case gender = "gender"
        case isHidden = "isHidden"
        case isBlocked = "isBlocked"
        case isMessagingAllowed = "isMessagingAllowed"
        case auth = "auth"
        case statistics = "statistics"
        case tagline = "tagline"
    }
}

struct AuthData: Codable {
    let rocketId: String?
    let isDisabled: Bool?
    let level: Int?
    
    enum CodingKeys: String, CodingKey  {
        case rocketId = "rocketId"
        case isDisabled = "isDisabled"
        case level = "level"
    }
}
struct StaticsData: Codable {
    let likes: Int?
    let thanks: Int?
    let uniqueName: Bool?
    let thanksNextLevel: Int?
    
    enum CodingKeys: String, CodingKey  {
        case likes = "likes"
        case thanks = "thanks"
        case uniqueName = "uniqueName"
        case thanksNextLevel = "thanksNextLevel"
    }
}

struct StatsData: Codable {
    let likes: StatsItemsData?
    let views: StatsItemsData?
    let comments: StatsItemsData?
    let shares: StatsItemsData?
    let replies: StatsItemsData?
    let timeLeftToSpace: StatsItemsData?
    
    enum CodingKeys: String, CodingKey  {
        case likes = "likes"
        case views = "views"
        case comments = "comments"
        case shares = "shares"
        case replies = "replies"
        case timeLeftToSpace = "timeLeftToSpace"
    }
}

struct StatsItemsData: Codable {
    let count: Int?
    let my: Bool?
    
    enum CodingKeys: String, CodingKey  {
        case count = "count"
        case my = "my"
    }
}
