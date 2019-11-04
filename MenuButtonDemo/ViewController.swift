//
//  ViewController.swift
//  MenuButton
//
//  Created by Tuyen Le on 09.03.19.
//  Copyright © 2019 Tuyen Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuButton1: MenuButton! {
        didSet {
            menuButton1.ontap = { _ in
                // Do something
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let menuButton = MenuButton(frame: CGRect(x: view.frame.midX, y: view.frame.midY, width: 100, height: 100))
        menuButton.ontap = { tapped in
            print(tapped)
        }
        view.addSubview(menuButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

