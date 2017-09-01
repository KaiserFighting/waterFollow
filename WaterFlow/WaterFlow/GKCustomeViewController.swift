//
//  GKCustomeViewController.swift
//  02-瀑布流
//
//  Created by caesar on 2017/6/7.
//  Copyright © 2017年 guokai. All rights reserved.
//

import UIKit

class GKCustomeViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //1.校验手势是否有值
        guard let interactionGes = interactivePopGestureRecognizer else {
            return
        }
        //2.通过运行时机制找到对应想要的属性
        /*
        var count : UInt32 = 0;
       let ivars =  class_copyIvarList(UIGestureRecognizer.self, &count)!
        for i in 0..<count{
            let ivar = ivars[Int(i)]
            let nameP = ivar_getName(ivar)
            let name = String(cString : nameP!)
            print(name)
            
        }
        */
        
       guard let values = interactionGes.value(forKeyPath: "_targets") as? [NSObject] else{
            return
        }
        
        guard let objc = values.first else{
            return
        }
        print(objc)
        //3.取出action/target
        let target = objc.value(forKeyPath: "target")
//        let action = objc.value(forKeyPath: "action")
        let action = Selector(("handleNavigationTransition:"))//通过字符串创建一个方法
        
        //2.创建自己的手势
        let panges = UITapGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(panges)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
