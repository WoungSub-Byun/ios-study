//
//  Models.swift
//  instagram
//
//  Created by 변웅섭 on 2021/08/04.
//

import Foundation

enum Gender {
    case male, female, other
}

struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}

struct User {
    let username: String
    let bio: String
    let name: (first: String, last: String)
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}

public enum UserPostType {
    case photo, video
}

/// Represent a user post
public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postUrl: URL
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdAt: Date
    let userTagged: [User]
}

struct PostLike {
    let userName: String
    let postIdentifier: String
}

struct CommentLike {
    let userName: String
    let commentIdentifier: String
}

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createAt: Date
    let likes: [CommentLike]
}
