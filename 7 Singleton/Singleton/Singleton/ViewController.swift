//
//  ViewController.swift
//  Singleton
//
//  Created by Алексей Макаров on 29.01.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let safe = Safe.shared
        print(safe.money)
        
    }


}

