//
//  ViewController.swift
//  RouterDemo
//
//  Created by KKday on 2021/9/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.view.backgroundColor = UIColor(red: CGFloat.random(), green: CGFloat.random(), blue: CGFloat.random(), alpha: 1)
    }

}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
