//
//  AlertRouteRule.swift
//  RouterDemo
//
//  Created by KKday on 2021/9/23.
//

import UIKit
import URLNavigator

public class AlertRouteRule : RouteRule {
    public static var pattern: URLPattern {
        get {
            return "kkday://alert/<style>"
        }
    }
    public static var handler: URLOpenHandlerFactory {
        get {
            return { url, params, context in
                let styleMap : [String:UIColor] = [
                    "light" : .white,
                    "dark" : .darkGray
                ]
                let title = url.queryParameters["title"] ?? "System Message"
                let message = url.queryParameters["message"] ?? "System Message"
                let style = params["style"] as? String ?? "light"
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = styleMap[style] ?? .red
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(action)
                UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
                return true
            }
        }
    }
}



