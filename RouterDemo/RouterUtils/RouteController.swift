//
//  RouteController.swift
//  RouterDemo
//
//  Created by KKday on 2021/9/23.
//

import Foundation
import URLNavigator

public class RouteController {
    public static let shared : RouteController = RouteController()
    let _router = Navigator()
    public func addRules(_ rules: RouteRule.Type...) {
        for rule in rules {
            _router.handle(rule.pattern, rule.handler)
        }
    }
    public func open(_ url:URLConvertible) {
        _router.open(url)
    }
}
