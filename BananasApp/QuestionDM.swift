//
//  QuestionDM.swift
//  BananasApp
//
//  Created by Sanjarbek Abdurayimov on 02/07/23.
//

import UIKit

struct QuestionDM {
    var first: Int
    var second: Int
    
    var answer: Int {
        first + second
    }
    
    var variants: [Int] {
        let array: [Int] = [answer+1, answer-1,answer,answer+2]
        
        
        return array
        
//        while array.count != 4 {
//            let randomElement = (1...10).randomElement()!
//            if !array.contains(randomElement){
//                array.append(randomElement)
//            }
//        }
//        return array.shuffled()
    }
    
   
}
