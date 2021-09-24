//
//  InputComponent.swift
//  jsCoreToy
//
//  Created by 李杰駿 on 2021/9/12.
//  Copyright © 2021 李杰駿. All rights reserved.
//

import UIKit
import SnapKit

class InputComponent : UIView {
    private let titleLabel : UILabel = {
        let _lbl = UILabel()
        _lbl.font = UIFont.systemFont(ofSize: 14)
        _lbl.textColor = UIColor.darkGray
        _lbl.adjustsFontSizeToFitWidth = true
        _lbl.minimumScaleFactor = 0.5
        return _lbl
    }()
    private let textField : UITextField = {
        let _tf = UITextField()
        _tf.placeholder = "write here..."
        _tf.font = UIFont.systemFont(ofSize: 12)
        _tf.textColor = .blue
        return _tf
    }()
    private let seperateLine : UIView = {
       let _v = UIView()
        _v.backgroundColor = .lightGray
        return _v
    }()
    init(title:String, frame:CGRect) {
        super.init(frame: frame)
        titleLabel.text = title
        let stack : UIStackView = UIStackView(arrangedSubviews: [titleLabel,textField])
        stack.axis = .horizontal
        stack.spacing = 5
        self.addSubview(stack)
        self.addSubview(seperateLine)
        seperateLine.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.bottom.left.right.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.centerY.equalToSuperview()
            make.width.lessThanOrEqualTo(50).priority(.medium)
        }
        textField.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.centerY.equalToSuperview()
        }
        stack.snp.makeConstraints { (make) in
            make.width.centerX.top.equalToSuperview()
            make.bottom.equalTo(seperateLine.snp_topMargin)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getText()->String? { textField.text }
}
