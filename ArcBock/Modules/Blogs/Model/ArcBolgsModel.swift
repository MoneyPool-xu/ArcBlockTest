//
//  ArcBolgsModel.swift
//  ArcBock
//
//  Created by baiyi on 2024/12/6.
//

import Foundation

struct Blog: Decodable {
    let latestCommenters: [String]
//    let meta: Meta
    let id: String
    let slug: String
    let title: String
    let author: String
    let cover: String
    let excerpt: String
    let boardId: String
    let createdAt: String
    let updatedAt: String
    let commentCount: Int
    let type: String
    let status: String
    let publishTime: String
    let labels: [String]
    let locale: String
}

struct Blogs: Decodable {
    let data: [Blog]
}
