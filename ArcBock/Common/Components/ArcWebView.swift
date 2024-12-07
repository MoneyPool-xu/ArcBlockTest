//
//  ArcWebView.swift
//  ArcBock
//
//  Created by baiyi on 2024/12/7.
//

import SwiftUI
import WebKit

struct ArcWebView: UIViewRepresentable {
    let url: URL
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
}
