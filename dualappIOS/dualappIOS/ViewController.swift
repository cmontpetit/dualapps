//
//  ViewController.swift
//  dualappIOS
//
//  Created by Claude Montpetit on 2014-09-03.
//  Copyright (c) 2014 dualapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBAction func listEntitiesInLog(sender: AnyObject) {
        (UIApplication.sharedApplication().delegate as AppDelegate).modelManager!.logEntities()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

