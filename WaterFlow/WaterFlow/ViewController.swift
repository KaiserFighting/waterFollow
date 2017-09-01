//
//  ViewController.swift
//  WaterFlow
//
//  Created by caesar on 2017/9/1.
//  Copyright © 2017年 molyfun. All rights reserved.
//

import UIKit

private let kIdenrifier = "Idenrifier"

class ViewController: UIViewController {
    
    fileprivate var itemCount = 30
    
    fileprivate lazy var collectionView : UICollectionView = {
        let layout = GKWaterFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.cols = 2
        layout.dataSource = self
        let collectionView = UICollectionView(frame : self.view.bounds, collectionViewLayout :layout );
        collectionView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kIdenrifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        view.backgroundColor = UIColor.white
    }
    
}


extension ViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kIdenrifier, for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        
        if indexPath.item == itemCount - 1 {
            itemCount += 30
            collectionView.reloadData()
        }
        
        
        return cell
        
    }
}


extension ViewController : GKWaterFlowLayoutDataSource {
    func  waterFallLayout(_ layout: GKWaterFlowLayout, itemIndex: Int) -> CGFloat {
        let screenW = UIScreen.main.bounds.width
        return  itemIndex % 2 == 0 ? screenW * 2 / 3 : screenW * 0.5
    }
}



