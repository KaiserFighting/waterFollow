//
//  GKWaterFlowLayout.swift
//  02-瀑布流
//
//  Created by caesar on 2017/5/24.
//  Copyright © 2017年 guokai. All rights reserved.
//

import UIKit

protocol GKWaterFlowLayoutDataSource : class {
    func waterFallLayout(_ layout : GKWaterFlowLayout , itemIndex : Int) -> CGFloat
}

class GKWaterFlowLayout: UICollectionViewFlowLayout {
    var cols = 2 //两列
    weak var dataSource : GKWaterFlowLayoutDataSource?
    fileprivate lazy var attributes : [UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
    fileprivate lazy var maxheight : CGFloat = self.sectionInset.top +  self.sectionInset.bottom
}

// MARK -- 准备所有cell的布局
extension GKWaterFlowLayout{
    override func prepare() {
        super.prepare()
        
        //CellFrame -> UICollectionViewLayoutAttributes
        //0.校验collectionView有没有值
        guard let collectionView = collectionView else {
            return
        }
        //1.获取cell的个数
        let count = collectionView.numberOfItems(inSection: 0)
        //2.遍历所有的cell，给每一个cell准备一个UICollectionViewLayoutAttributes
        
        let itemW = (collectionView.bounds.width - sectionInset.left - sectionInset.right - (CGFloat(cols) - 1) * minimumInteritemSpacing) / CGFloat(cols)
        var heights :[CGFloat] = Array(repeating: sectionInset.top, count: cols)
        
        for i in 0..<count{
            //2.1创建UICollectionViewLayoutAttributes,并且传入indexpath
            let indexPath = IndexPath(item: i, section: 0)
            let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            //2.2给attributes设置frame
            
            /*
            guard let itemH = dataSource?.waterFallLayout(self, itemIndex: i) else{
                fatalError("请设置数据源")
            }
            */
            let itemH = dataSource?.waterFallLayout(self, itemIndex: i) ?? 100
            
//            var minH = sectionInset.top
//            for height in heights{
//                if minH > height {
//                    minH = height
//                }
//            }
            
            let minH = heights.min()!
            let minIndex = heights.index(of: minH)!
            let itemX = sectionInset.left + (minimumInteritemSpacing + itemW) * CGFloat(minIndex)
//            let itemY = minH + minimumLineSpacing
            let itemY = minH
            attribute.frame = CGRect(x: itemX, y: itemY, width: itemW,height: itemH)
            //2.3 将attributes添加到数组中
            attributes.append(attribute)
            //2.4改变minIndex的位置高度
            heights[minIndex] = attribute.frame.maxY + minimumLineSpacing
        }
        
        //4.获取最大的高度
        maxheight = heights.max()! - minimumLineSpacing
    }

}

//MARK -- 告诉系统准备好的布局
extension GKWaterFlowLayout{
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        return attributes
    }
}

//MARK -- 告诉系统滚动范围(contenSize)
extension GKWaterFlowLayout{
    override var collectionViewContentSize :CGSize{
        
        return CGSize(width: 0, height: maxheight + sectionInset.bottom)
    }
    
    
    
    
    
    
    
    
    
    
    
}
