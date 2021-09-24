//
//  ConvButton.swift
//  jsCoreToy
//
//  Created by 李杰駿 on 2021/9/12.
//  Copyright © 2021 李杰駿. All rights reserved.
//

import UIKit

class ConvButton: UIButton {
    let touchUpInsideAction:(UIButton)->Void
    init(action : @escaping (UIButton)->Void, frame : CGRect = .zero) {
        touchUpInsideAction = action
        super.init(frame: frame)
        self.addTarget(self, action: #selector(btnAction(btn:)), for: .touchUpInside)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func btnAction(btn:UIButton) {
        touchUpInsideAction(btn)
    }
}
