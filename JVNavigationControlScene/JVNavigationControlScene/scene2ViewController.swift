//
//  scene2ViewController.swift
//  JVNavigationControlScene
//
//  Created by Jarvan on 2017/3/27.
//  Copyright © 2017年 Jarvan. All rights reserved.
//

import UIKit

class scene2ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="不使用weak Scene"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func pushClick(_ sender: UIButton) {
        //获取storyboard中的 ViewController
        let story = UIStoryboard.init(name: "Main", bundle: nil)
       let nextVC = story.instantiateViewController(withIdentifier: "nextViewController") as! nextViewController
        
        nextVC.testBlock={(param:String) in
            self.doSomething(str: param)
        }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    @IBAction func popClick(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    func doSomething(str:String){
        self.textLabel.text=str
    }
    
    
    deinit {
        print("scene2ViewController deinit")
    }

}
