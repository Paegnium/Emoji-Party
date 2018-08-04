//
//  ViewController.swift
//  Emoji Party
//
//  Created by Wylie Quah on 4/8/18.
//  Copyright © 2018 Edgefield. All rights reserved.
//

import UIKit

class EmojiViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

