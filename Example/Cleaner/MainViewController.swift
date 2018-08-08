//
//  MainViewController.swift
//  Cleaner_Example
//
//  Created by Francisco Javier Trujillo Mata on 03/08/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Cleaner

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        saveValuesUserDefault()
        
        //Remove everything
        let cleaner = Cleaner()
        cleaner.cleanEverything()
        
    }
    
    func saveValuesUserDefault()  {
        UserDefaults.standard.set("Chiquito Ipsum", forKey: "Fistrum")
        UserDefaults.standard.synchronize()
    }

}
