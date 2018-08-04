//
//  ViewController.swift
//  Emoji Party
//
//  Created by Wylie Quah on 4/8/18.
//  Copyright © 2018 Edgefield. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let labelWidth: Double = 60

class EmojiViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mainView: UIView!
    var emojis = ["🦄","🐳","🐠"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EmojiPartyCollectionViewCell
        
        cell.label.text = emojis[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedEmoji = emojis[indexPath.item]
        let randX = drand48() * (Double(mainView.frame.width) - labelWidth)
        let randY = drand48() * Double(mainView.frame.height)
        let label = UILabel(frame: CGRect(x: randX, y: randY, width: labelWidth, height: labelWidth))
        label.text = selectedEmoji
        mainView.addSubview(label)
        
    }

}

