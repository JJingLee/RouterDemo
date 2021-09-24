//
//  WebRouteRule.swift
//  RouterDemo
//
//  Created by KKday on 2021/9/24.
//

import Foundation
import URLNavigator
import WebKit

public class WebRouteRule : RouteRule {
    public static var pattern: URLPattern {
        get {
            return "https://<domain>"
        }
    }
    public static var handler: URLOpenHandlerFactory {
        get {
            return { url, params, context in
                let VC = UIViewController()
                VC.view.backgroundColor = .white
                let webview = WKWebView()
                VC.view.addSubview(webview)
                webview.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
                guard let _urlStr = url as? String else {return false}
                guard let _url = URL(string: _urlStr) else {return false}
                UIApplication.topViewController()?.present(VC, animated: true, completion: {
                    webview.load(URLRequest(url: _url))
                })
                return true
            }
        }
    }
}
