//
//  Post.swift
//  Navigation
//
//  Created by Julia Ghirnic on 08.06.2022.
//

import UIKit

struct Const {
    
    static let leadingMargin: CGFloat = 16
    static let trailingMargin: CGFloat = -16
    static let indent: CGFloat = 16
    
}

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}



var post1 = Post(author: "Albert Einstein", description: "Profession", image: "activity", likes: 7, views: 9)

var post2 = Post(author: "Albert Einstein", description: "Marittal status", image: "wife", likes: 7, views: 12)

var post3 = Post(author: "Albert Einstein", description: "My hobby", image: "relaxation", likes: 11, views: 24)

var post4 = Post(author: "Albert Einstein", description: "Also I prefair:", image: "music", likes: 0, views: 30)

var postArray = [post1, post2, post3, post4]

