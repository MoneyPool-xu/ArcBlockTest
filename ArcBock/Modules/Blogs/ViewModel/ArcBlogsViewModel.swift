//
//  ArcBlogsViewModel.swift
//  ArcBock
//
//  Created by baiyi on 2024/12/6.
//

import Foundation

class ArcBlogsViewModel: ObservableObject {
    @Published var blogs: [Blog] = []
    @Published var isLoading = false
    @Published var isLoadingMore = false
    private var currentPage = 1
    private let apiService = ArcRequestApi.shared
    
    // request the data
    private func loadData(
        onSuccess: @escaping ([Blog]) -> Void,
        onFailed: @escaping () -> Void
    ) {
        apiService.getRequestData(url: "blogs?page=\(currentPage)&size=20&locale=zh", type: Blogs.self) { blogsData, sucess in
            onSuccess(blogsData.data)
        } onFailed: { error in
            onFailed()
        }
    }
    
    // request the data of first page
    func loadFirstPageData() {
        currentPage = 1
        isLoading = true
        loadData() { [self] data in
            isLoading = false
            blogs = resolveData(data: data)
        } onFailed: { [self] in
            isLoading = false
        }
    }
    
    // request the more data with other page
    func loadMoreData() {
        guard !isLoadingMore else {
            return
        }
        isLoadingMore = true
        currentPage += 1
        loadData {[self] data in
            isLoadingMore = false
            let newBlogs = resolveData(data: data)
            blogs.append(contentsOf: newBlogs)
        } onFailed: {[self] in
            isLoadingMore = false
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
