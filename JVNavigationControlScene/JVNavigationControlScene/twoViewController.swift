//
//  ViewController.swift
//  JVBlockTest
//
//  Created by Jarvan on 2017/3/24.
//  Copyright © 2017年 Jarvan. All rights reserved.
//

import UIKit

class twoViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var testOneblock:((_ a:String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pushClick(_ sender: UIButton) {
        //获取storyboard: 通过bundle根据storyboard的名字来获取我们的storyboard,
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        //由storyboard根据myView的storyBoardID来获取我们要切换的视图
        let nextVC = story.instantiateViewController(withIdentifier: "nextViewController") as! nextViewController
        
        nextVC.testBlock={(param:String) in
            self.doSomething(str: param)
        }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
//        self.testOneblock={(a:String) in
//            self.textLabel.text=a;
//        }
    }
    
    @IBAction func popClick(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    func doSomething(str:String){
        self.textLabel.text=str
    }
    
    
    deinit {
        print("oneViewController deinit")
    }
}

