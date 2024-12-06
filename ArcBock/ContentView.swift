//
//  ContentView.swift
//  ArcBock
//
//  Created by baiyi on 2024/12/6.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            loadData()
        }
    }
    
    func loadData() {
        ArcRequestApi.shared.getRequestData(url: "https://www.arcblock.io/blog/api/blogs?page=1&size=20&locale=zh", type: Blogs.self) { data, sucess in
            
        } onFailed: { error in
            
        }

    }
    
    
    
}

#Preview {
    ContentView()
}
