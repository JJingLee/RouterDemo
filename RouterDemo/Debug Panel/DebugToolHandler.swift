//
//  DebugToolHandler.swift
//  RouterDemo
//
//  Created by KKday on 2022/2/10.
//

import Foundation
import DebugTool

class DebugToolHandler {
    static let shared = DebugToolHandler()
    func setup() {
        DebugNodeConfigs.debugNodes = [
            ActionDebugNode(name: "路由測試", action: {
                
                let routerPanel = UIView(frame: CGRect(x: 0, y: 200, width: 0, height: 0))
                routerPanel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
                
                let title = UILabel()
                title.layer.borderWidth = 1
                title.layer.borderColor = UIColor.white.cgColor
                title.backgroundColor = .clear
                title.textColor = .white
                title.textAlignment = .center
                title.text = "URL:"
                
                let textField = UITextField()
                textField.backgroundColor = .clear
                textField.textColor = UIColor.white
                textField.placeholder = "input router..."
                
                let go = UILabel()
                go.isUserInteractionEnabled = true
                go.layer.borderWidth = 1
                go.layer.borderColor = UIColor.white.cgColor
                go.backgroundColor = .clear
                go.textColor = .white
                go.textAlignment = .center
                go.text = "go"
                go.kkGesture.click {
                    RouteController.shared.open(textField.text ?? "")
                }
                
                let close = UILabel()
                close.isUserInteractionEnabled = true
                close.textAlignment = .center
                close.layer.borderWidth = 1
                close.layer.borderColor = UIColor.white.cgColor
                close.backgroundColor = .clear
                close.textColor = .white
                close.text = "close"
                close.kkGesture.click {
                    routerPanel.removeFromSuperview()
                }
                
                let stackView = UIStackView(arrangedSubviews: [title,textField,go,close])
                stackView.axis = .horizontal
                stackView.alignment = .center
                
                
                routerPanel.addSubview(stackView)
                stackView.translatesAutoresizingMaskIntoConstraints = false
                routerPanel.addConstraints([
                    stackView.widthAnchor.constraint(equalTo: routerPanel.widthAnchor, multiplier: 1),
                    stackView.centerXAnchor.constraint(equalTo: routerPanel.centerXAnchor),
                    stackView.topAnchor.constraint(equalTo: routerPanel.topAnchor),
                    routerPanel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
                ])
                
                stackView.addConstraints([
                    title.heightAnchor.constraint(equalToConstant: 44),
                    title.widthAnchor.constraint(equalToConstant: 44)
                ])
                stackView.addConstraints([
                    textField.heightAnchor.constraint(equalToConstant: 44),
                ])
                stackView.addConstraints([
                    go.heightAnchor.constraint(equalToConstant: 44),
                    go.widthAnchor.constraint(equalToConstant: 44)
                ])
                stackView.addConstraints([
                    close.heightAnchor.constraint(equalToConstant: 44),
                    close.widthAnchor.constraint(equalToConstant: 44)
                ])
                UIApplication.shared.windows.first!.addSubview(routerPanel)
                routerPanel.translatesAutoresizingMaskIntoConstraints = false
                routerPanel.superview?.addConstraints([
                    routerPanel.widthAnchor.constraint(equalTo: routerPanel.superview!.widthAnchor, multiplier: 0.8),
                    routerPanel.centerXAnchor.constraint(equalTo: routerPanel.superview!.centerXAnchor),
                    routerPanel.topAnchor.constraint(equalTo: routerPanel.superview!.topAnchor, constant: (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)+64)
                ])
            }),
            BaseDebugNode(name: "埋點測試", subNodes: [
                ActionDebugNode(name: "action", action: {
                    print("action!")
                })
            ]),
            BaseDebugNode(name: "網路測試", subNodes: [
                ActionDebugNode(name: "action2", action: {
                    print("action2!")
                })
            ])
        ]
        DebugBall().toggle(on: UIApplication.shared.windows.first!)
    }
}
