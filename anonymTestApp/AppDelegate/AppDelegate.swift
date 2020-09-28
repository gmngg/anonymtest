//
//  AppDelegate.swift
//  anonymTestApp
//
//  Created by Malygin Georgii on 22.09.2020.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        prepareWindow()
        
        return true
    }
    
    func prepareWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        MainAssembly().coordinator(with: window).start()
    }


}
//
//{   "id":"p:xtLwAjrIym",
//    "replyOnPostId":null,
//    "type":"PLAIN",
//    "status":"PUBLISHED",
//    "hidingReason":null,
//    "coordinates": {
//        "latitude": 60.74050279401705,
//        "longitude": 171.1524010226274,
//        "zoom":null
//    },
//    "isCommentable":true,
//    "hasAdultContent":false,
//    "isAuthorHidden":false,
//    "isHiddenInProfile":false,
//    "contents": [ {
//        "type":"IMAGE",
//        "id":"65/52/2NviPAKbd9yCAOTusMJvJ.BwBaAKAAtABAAWcBgAI.jpeg",
//        "data": {
//            "extraSmall": {
//                "url":"https://d1wiosyzmyvfsz.cloudfront.net/65/52/2NviPAKbd9yCAOTusMJvJ_90x160.jpeg",
//                "size": {
//                    "width":90,
//                    "height":160
//                    }
//                },
//            "small": {
//                "url":"https://d1wiosyzmyvfsz.cloudfront.net/65/52/2NviPAKbd9yCAOTusMJvJ_180x320.jpeg",
//                "size": {
//                        "width":180,"height":320
//                            }
//                    },
//            "medium": { "url":"https://d1wiosyzmyvfsz.cloudfront.net/65/52/2NviPAKbd9yCAOTusMJvJ_359x640.jpeg",
//                "size": {
//                    "width":359,"height":640}
//                        }
//                    }
//            }
//    ,{
//        "type":"TEXT",
//        "data": {
//                 "value": "У меня низкая самооценка (это связано с тем, что в окружении находятся красивые и талантливые ребята), а я не особо могу похвастаться своей красотой... точнее вообще не могу. Поэтому чаще всего стесняюсь себя..\n\nСкажите, как поднять самооценку и что вообще делать в такой ситуации?\n*я девушка"
//    }}
//    ,{
//        "type":"TAGS",
//        "data": {  "values": ["share_/_offer","useful_and_interesting"]
//            }
//        }
//        ]
//    ,
//    "language":"en",
//    "awards": {
//        "recent":[],
//        "statistics":[],
//        "voices":0,
//        "awardedByMe":false},
//    "createdAt":1600747878000,
//    "updatedAt":1600750824000,
//    "page":null,
//    "author": {
//        "id":"626922",
//        "url":null,
//        "name":"\ninfant",
//        "banner":null,
//        "photo": {
//            "type":"IMAGE",
//            "id":"66/32/IFx6TjeuSUrUVtr8MRdNc.A0CgAKAAQAFAAVgCWAI.jpg",
//            "data": {
//                "extraSmall": {
//                    "url":"https://d1wiosyzmyvfsz.cloudfront.net/66/32/IFx6TjeuSUrUVtr8MRdNc_160x160.jpg",
//                    "size": {
//                        "width":160,"height":160
//                    }
//                },
//                "small": {
//                    "url":"https://d1wiosyzmyvfsz.cloudfront.net/66/32/IFx6TjeuSUrUVtr8MRdNc_320x320.jpg",
//                    "size": {
//                        "width":320,
//                        "height":320 }
//                },
//                "original": {
//                    "url":"https://d1wiosyzmyvfsz.cloudfront.net/66/32/IFx6TjeuSUrUVtr8MRdNc_600x600.jpg",
//                    "size":{
//                        "width":600,
//                        "height":600}
//                }
//            }
//        },
//        "gender":"FEMALE",
//        "isHidden":false,
//        "isBlocked":false,
//        "isMessagingAllowed":true,
//        "auth": {
//            "rocketId":"PemexuuYyoCbyATtD",
//            "isDisabled":false,
//            "level":0
//
//        },"statistics": {
//            "likes":0,
//            "thanks":1,
//            "uniqueName":false,
//            "thanksNextLevel":500
//        },
//        "tagline":"",
//        "data":{}
//    },
//    "stats": {
//        "likes": {
//            "count":1,
//            "my":false
//        },
//        "views": {
//            "count":11567,
//            "my":false
//        },
//        "comments": {
//            "count":0,
//            "my":false
//        },
//        "shares": {
//            "count":0,
//            "my":false
//        },
//        "replies": {
//            "count":0,
//            "my":false
//        },
//        "timeLeftToSpace": {
//            "count":null,
//            "my":false }
//        },
//    "isMyFavorite":false
//}
