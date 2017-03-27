//
//  ViewController.swift
//  JVBlockTest
//
//  Created by Jarvan on 2017/3/24.
//  Copyright © 2017年 Jarvan. All rights reserved.
//

import UIKit

class scene1ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    //持有下一个VC 出现在下一个VC需要频繁使用并且需要很多时间去加载的情况，让下一个VC的生命周期保持跟当前一致
    var nextVC:nextViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func pushClick(_ sender: UIButton) {
        //获取storyboard中的 ViewController
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        nextVC = story.instantiateViewController(withIdentifier: "nextViewController") as? nextViewController
        
        nextVC?.testBlock={[weak self] (param:String) in
            self?.doSomething(str: param)
        }
        
        self.navigationController?.pushViewController(nextVC!, animated: true)
    }
    
    @IBAction func popClick(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    func doSomething(str:String){
        self.textLabel.text=str
    }
    
    
    deinit {
        print("scene1ViewController deinit")
    }
}

