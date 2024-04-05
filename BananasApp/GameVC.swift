//
//  GameVC.swift
//  BananasApp
//
//  Created by Sanjarbek Abdurayimov on 02/07/23.
//

import UIKit

class GameVC: UIViewController {
    
    @IBOutlet weak var dimView: UIView!
    
    @IBOutlet weak var bananasLabel: UILabel!{
        didSet {
            bananasLabel.layer.cornerRadius = 15
            bananasLabel.layer.masksToBounds = true
        }
    }
    
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet var firstBananasImageViews: [UIImageView]!
  
    
    @IBOutlet var secondBananasImageView: [UIImageView]!
    
    @IBOutlet var variantsButoons: [UIButton]!
    
    var data = [QuestionDM]()
    var current_Question = 0
    var current_answer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
            data.append(QuestionDM(first: (1...5).randomElement()!, second: (1...5).randomElement()!))
        }
        dimView.isHidden = true
        setUpBananas()
       
    }
    
    override func viewDidLayoutSubviews() {
        bananasLabel.layer.cornerRadius = 30
        nextBtn.layer.cornerRadius = nextBtn.frame.height / 2
    }
    
    
    func setUpBananas(){
        nextBtn.isEnabled = false
        for i in firstBananasImageViews{
            i.isHidden = true
        }
        
        for i in secondBananasImageView {
            i.isHidden = true
        }
        
        for i in 0..<data[current_Question].first {
            firstBananasImageViews[i].isHidden = false
        }
        
        for i in 0..<data[current_Question].second {
            secondBananasImageView[i].isHidden = false
        }
        
        //        for i in variantsButoons.enumerated() {
        //            i.element.setTitle("\(data[current_Question].variants[i.offset])", for: .normal)
        //        }
        
        let variks = data[current_Question].variants.shuffled()
        
        variantsButoons[0].setTitle("\(variks[0])", for: .normal)
        variantsButoons[1].setTitle("\(variks[1])", for: .normal)
        variantsButoons[2].setTitle("\(variks[2])", for: .normal)
        variantsButoons[3].setTitle("\(variks[3])", for: .normal)
        
        for i in variantsButoons {
            i.setTitleColor(.white, for: .normal)
            i.isUserInteractionEnabled = true
        }
    }
    
    
    @IBAction func variantsPressed(_ sender: UIButton) {
        nextBtn.isEnabled = true
        let choosed_answer = sender.currentTitle
        
        if choosed_answer == "\(data[current_Question].answer)" {
            sender.setTitleColor(.green, for: .normal)
            
            current_answer += 1
        } else {
            sender.setTitleColor(.red, for: .normal)
            
            for i in variantsButoons.enumerated() {
                if i.element.currentTitle == "\(data[current_Question].answer)" {
                    variantsButoons[i.offset].setTitleColor(.green, for: .normal)
                    break
                }
            }
        }
        for i in variantsButoons {
            i.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet weak var resulLabel: UILabel!
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        current_Question += 1
        if current_Question < data.count {
            
            setUpBananas()
        } else {
            dimView.isHidden = false
            resulLabel.text = "\(current_answer)/\(data.count)"
        }
    }
    
    @IBAction func restartPressed(_ sender: Any) {
        dimView.isHidden = true
        current_answer = 0
        current_Question = 0
        setUpBananas()
    }
    
    
    @IBAction func homePressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
