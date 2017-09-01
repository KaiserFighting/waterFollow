//
//  UIColor+extension.swift
//  GKPageView
//
//  Created by caesar on 2017/5/9.
//  Copyright © 2017年 guokai. All rights reserved.
//

import UIKit

extension UIColor{
    //class 修改的函数,类似于OC中 + 方法 //类方法
    class func randomColor() -> UIColor {
        
        return UIColor(red: CGFloat(arc4random_uniform(255)) / 255.0, green: CGFloat(arc4random_uniform(255)) / 255.0, blue: CGFloat(arc4random_uniform(255)) / 255.0, alpha: 1.0)
    }
    //swift默认参数
    //特性 ： 在extension 扩展构造函数 ,必须扩充便利构造函数
    /*
     1>必须在init前，加上convenience
     2>必须调用self.init()原有的某一个构造函数
     */
    convenience init(r : CGFloat, g : CGFloat ,b : CGFloat , a : CGFloat = 1.0){
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    convenience init?(hexString : String){
        // ## # 0X 0x
        //1.判断字符串的长度是否大于等于6
        guard hexString.characters.count >= 6 else {
            return nil
        }
        //2.讲字符串转化成大写
        var hexTempString = hexString.uppercased()
        //3.判断字符串是否是0xFF0022
        if hexTempString.hasPrefix("0X") || hexTempString.hasPrefix("##") {
            hexTempString = (hexString as NSString).substring(from: 2)
        }
        //4.判断字符串是否已#开头
        if hexTempString.hasPrefix("#") {
            hexTempString = (hexString as NSString).substring(from: 2)
        }
        //5.获取RGB分别对应的十六机制
        var range = NSRange(location:0, length:2)
        let rHex = (hexTempString as NSString).substring(with: range)
        range.location = 2
        let gHex = (hexTempString as NSString).substring(with: range)
        range.location = 4
        let bHex = (hexTempString as NSString).substring(with: range)
        
        //6.将十六进制转化成数值
        var r : UInt32 = 0
        var g : UInt32 = 0
        var b : UInt32 = 0
        //扫描器
         Scanner(string: rHex).scanHexInt32(&r)
         Scanner(string: gHex).scanHexInt32(&g)
         Scanner(string: bHex).scanHexInt32(&b)
        self.init(r : CGFloat(r), g :CGFloat(g) , b : CGFloat(b))
    }

}

//MARK -- 从颜色只获取RGB值
extension UIColor{
    //对象方法
    func getRGBValue() ->(CGFloat,CGFloat,CGFloat){
        /*
        guard let comps = cgColor.components else {
         fatalError("请确定该颜色是通过RGB创建的！！！")
        }
        return (comps[0] * 255,comps[1] * 255,comps[2] * 255)
        */
        
        //获取RGB值
        var red : CGFloat = 0;
        var green : CGFloat = 0
        var blue : CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: nil)
         return (red * 255,green * 255,blue * 255)
    }
    
}






