//
//  RouteRule.swift
//  RouterDemo
//
//  Created by KKday on 2021/9/23.
//

import Foundation
import URLNavigator

public protocol RouteRule {
    static var pattern : URLPattern { get }
    static var handler : URLOpenHandlerFactory { get }
}
