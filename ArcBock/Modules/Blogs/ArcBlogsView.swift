//
//  ContentView.swift
//  ArcBock
//
//  Created by baiyi on 2024/12/6.
//

import SwiftUI
import Kingfisher


struct ArcBlogsView: View {
    @ObservedObject var viewModel = ArcBlogsViewModel()
    
    var body: some View {
        NavigationStack{
            List {
                ForEach($viewModel.blogs, id: \.id) { $blog in
                    BlogCard(blog: blog, viewModel: viewModel)
                        .background(
                            NavigationLink(destination: ArcBlogDetail(url: URL(string: "\(BLOG_BLOG_DETAIL_H5_BASE_URL)\(blog.slug)")!)) {
                            }
                        )
                   
                    
//                    BlogCard(blog: blog, viewModel: viewModel)
                }
            }
                .listStyle(.plain)
        }
        .padding()
        .onAppear {
            viewModel.loadData()
        }
    }
}

#Preview {
    ArcBlogsView()
}

struct BlogCard: View {
    var blog: Blog
    var viewModel: ArcBlogsViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color(UIColor.systemGray6)]), // 渐变颜色
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            HStack {
                CoverImage(imageUrl: blog.cover)
                VStack(alignment: .leading, spacing: 5) {
                    Text(blog.title)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                    Text(blog.excerpt)
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                        .lineLimit(3)
                    BlogLabel(labels: blog.labels, viewModel: viewModel)
                    Text(blog.updatedAt)
                        .font(.system(size: 12))
                }
                .padding()
                
            }
            
        }
        .cornerRadius(12)
        .listRowSeparator(.hidden)
    }
}

struct CoverImage: View {
    var imageUrl: String
    var body: some View {
        KFImage(URL(string: imageUrl))
            .placeholder {
                ProgressView()
            }
            .onSuccess { result in
            }
            .resizable()
            .cornerRadius(6)
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
    }
}

struct BlogLabel: View {
    var labels: [String]
    var viewModel: ArcBlogsViewModel
    var body: some View {
        HStack {
            let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
            LazyVGrid(columns: columns, alignment: .leading, spacing: 5) {
                ForEach(labels, id: \.self) { label in
                    Text(viewModel.getLabelTitle(label: label))
                        .lineLimit(1)
                        .font(.system(size: 10))
                        .padding(5)
                        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(5)
                    
                }
            }
        }
    }
}
