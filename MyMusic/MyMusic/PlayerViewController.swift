//
//  PlayerViewController.swift
//  MyMusic
//
//  Created by 변웅섭 on 2021/07/09.
//

import UIKit

class PlayerViewController: UIViewController {
    
    public var position: Int = 0
    public var songs: [Song] = []
    
    @IBOutlet var holder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 1 {
            configure()
        }
    }
    
    func configure() {
        // set up player
        
        // set up user interface elelments
    }
    
}
