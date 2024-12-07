//
//  ArcBlogDetail.swift
//  ArcBock
//
//  Created by baiyi on 2024/12/7.
//

import SwiftUI

struct ArcBlogDetail: View {
    let url: URL
    
    var body: some View {
        ArcWebView(url: url)
    }
}

#Preview {
    ArcBlogDetail(url: URL(string: "https://www.arcblock.io/blog/zh/arcblock-monthly-newsletter-december-2024")!)
}
