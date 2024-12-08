//
//  ArcBlogDetail.swift
//  ArcBock
//
//  Created by baiyi on 2024/12/7.
//

import SwiftUI

struct ArcBlogDetail: View {
    let url: URL
    let title: String
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        VStack {
            ArcWebView(url: url)
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("\(Image(systemName: "chevron.left"))")
                        .foregroundColor(.black)
                        
                }
            }
        }
        .navigationTitle(title)
        
    }
}

#Preview {
    ArcBlogDetail(url: URL(string: "https://www.arcblock.io/blog/zh/arcblock-monthly-newsletter-december-2024")!, title: "newsletter")
}
