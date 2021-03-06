//
//  ViewController.swift
//  Emoji Party
//
//  Created by Wylie Quah on 4/8/18.
//  Copyright © 2018 Edgefield. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let labelWidth: Double = 50

class EmojiViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mainView: UIView!
    var emojis = ["🦄","🐳","🐠"]
    
    var animator: UIDynamicAnimator!
    var collisions: UICollisionBehavior!
    var gravity: UIGravityBehavior!
    var dynamics: UIDynamicItemBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: mainView)
        collisions = UICollisionBehavior(items: [])
        collisions.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisions)
        gravity = UIGravityBehavior(items: [])
        animator.addBehavior(gravity)
        dynamics = UIDynamicItemBehavior(items: [])
        dynamics.elasticity = 1.05
        dynamics.resistance = 0
        animator.addBehavior(dynamics)
        
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
        label.font = label.font.withSize(60)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        mainView.addSubview(label)
        collisions.addItem(label)
        dynamics.addItem(label)
//        gravity.addItem(label)
        let push = UIPushBehavior(items: [label], mode: .instantaneous)
        push.angle = CGFloat(drand48() * .pi * 2)
        push.magnitude = CGFloat(1.0 + drand48() * 2)
        animator.addBehavior(push)
        
    }

}

