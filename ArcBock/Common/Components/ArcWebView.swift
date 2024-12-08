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
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}

class Coordinator: NSObject, WKNavigationDelegate {
    var parent: ArcWebView
    
    init(_ parent: ArcWebView) {
        self.parent = parent
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let js = """
            const observer = new MutationObserver((mutations, observer) => {
                const header = document.querySelector('.css-xx5gzi');
                if (header) {
                    header.style.display = 'none';
                    observer.disconnect();
                }
            });
            observer.observe(document, { childList: true, subtree: true });
        """
        webView.evaluateJavaScript(js, completionHandler: nil)
        
    }
}


