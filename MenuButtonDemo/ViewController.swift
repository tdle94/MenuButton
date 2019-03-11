//
//  ViewController.swift
//  MenuButton
//
//  Created by Tuyen Le on 09.03.19.
//  Copyright © 2019 Tuyen Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(MenuButton(frame: CGRect(x: view.frame.midX, y: view.frame.midY, width: 50, height: 50)))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

