//
//  ViewController.swift
//  BananasApp
//
//  Created by Sanjarbek Abdurayimov on 02/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func viewDidLayoutSubviews() {
        greenView.layer.cornerRadius = 20
        greenView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        playButton.layer.cornerRadius = playButton.frame.height / 2
        playButton.clipsToBounds = true
    }
    
}

