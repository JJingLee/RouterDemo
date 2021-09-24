//
//  VCRouteRule.swift
//  RouterDemo
//
//  Created by KKday on 2021/9/23.
//

import UIKit
import URLNavigator

public class VCRouteRule : RouteRule {
    public static var pattern: URLPattern {
        get {
            return "kkday://VC/<className>/<showType>"
        }
    }
    public static var handler: URLOpenHandlerFactory {
        get {
            return { url, params, context in
                guard let className = params["className"] as? String else { return false }
                let showType = params["showType"] as? String ?? "push"
                guard let VC = viewController(from: className) else {return false}
                let actions : [String:()->Void] = [
                    "push" : {
                        UIApplication.topViewController()?.navigationController?.pushViewController(VC, animated: true)
                    },
                    "present" : {
                        UIApplication.topViewController()?.present(VC, animated: true, completion: nil)
                    },
                ]
                actions[showType]?()
                return true
            }
        }
    }
    private static func viewController(from string:String)->UIViewController? {
        let className = string
        guard let appName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String else {return nil}
        guard let metaClass = NSClassFromString("\(appName).\(className)") as? UIViewController.Type else { return nil }
        let VC = metaClass.init()
        return VC
    }
}
