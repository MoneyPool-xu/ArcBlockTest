//
//  ArcBlogsViewModel.swift
//  ArcBock
//
//  Created by baiyi on 2024/12/6.
//

import Foundation

class ArcBlogsViewModel: ObservableObject {
    @Published var blogs: [Blog] = []
    
    func loadData() {
        ArcRequestApi.shared.getRequestData(url: "https://www.arcblock.io/blog/api/blogs?page=1&size=20&locale=zh", type: Blogs.self) {[self] blogsData, sucess in
            blogs = resolveData(data: blogsData.data)
//            print(blogs)
            
        } onFailed: { error in
        }
    }
    
    private func resolveData(data: [Blog]) -> [Blog] {
        var resultData: [Blog] = []
        for var blog in data {
            blog.cover = BLOG_IMAGE_BASE_URL + blog.cover
            blog.updatedAt = formatterDate(dateStr: blog.updatedAt)
            blog.createdAt = formatterDate(dateStr: blog.createdAt)
            resultData.append(blog)
            
        }
        return resultData
    }
    
    private func formatterDate(dateStr: String) -> String {
        let isoDateFromatter = ISO8601DateFormatter()
        isoDateFromatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds] // 支持毫秒解析
        if let date = isoDateFromatter.date(from: dateStr) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let formattedDateString = dateFormatter.string(from: date)
            return formattedDateString
        }
        return ""
    }
    
    func getLabelTitle(label: String) -> String {
        return BLOG_LABELS[label] ?? label
    }
    
    
    
}
