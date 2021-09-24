//
//  ViewController.swift
//  RouterDemo
//
//  Created by KKday on 2021/9/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var routerInput : InputComponent = {
        let _input = InputComponent(title: "跳轉URL:", frame: .zero)
        return _input
    }()
    lazy var goButton : ConvButton = {
        let _btn = ConvButton { [weak self]btn in
            guard let url = self?.routerInput.getText() else {return}
            self?.gotoRouter(url: url)
        }
        _btn.setTitle("GO", for: .normal)
        _btn.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        _btn.setTitleColor(.white ,for: .normal)
        return _btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        configPanel()
    }
    
    private func configPanel() {
        let subViews : [UIView] = [
            routerInput,goButton
        ]
        let stack = UIStackView(arrangedSubviews: subViews)
        stack.axis = .vertical
        stack.spacing = 5
        view.addSubview(stack)
        routerInput.snp.makeConstraints { make in
            make.height.equalTo(55)
            make.width.equalToSuperview()
        }
        goButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
        stack.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().offset(-50)
        }
        
    }
    
    func gotoRouter(url:String) {
        RouteController.shared.open(url)
    }

}
