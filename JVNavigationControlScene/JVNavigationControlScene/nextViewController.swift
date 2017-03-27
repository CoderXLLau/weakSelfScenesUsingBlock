//
//  nextViewController.swift
//  JVBlockTest
//
//  Created by Jarvan on 2017/3/24.
//  Copyright © 2017年 Jarvan. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {

    
    var testBlock:((_ para:String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="第三个控制器"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func popClick(_ sender: UIButton) {
        if self.testBlock != nil {
            self.testBlock?("next return String")
        }
       _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    
    deinit {
        print(" nextViewController deinit")
    }

}
