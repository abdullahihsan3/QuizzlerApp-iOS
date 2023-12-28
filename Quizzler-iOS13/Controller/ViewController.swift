//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateButtons()
        updateUi()
    
    }
    
    @IBOutlet weak var scoreOutlet: UILabel!
    @IBOutlet weak var questionOutlet: UILabel!
    
    @IBOutlet weak var progressOutlet: UIProgressView!
    
    
    @IBOutlet weak var option1Outlet: UIButton!
    @IBOutlet weak var option2Outlet: UIButton!
    @IBOutlet weak var option3Outlet: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    @IBAction func answerButtonOutlet(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! //True or False
        let userGotItRight: Bool =  quizBrain.checkAnswer(userAnswer: userAnswer)
        if(userGotItRight){
            sender.backgroundColor = UIColor.green
        }
        else{
    
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
 

    }
    @objc func updateUi(){
        questionOutlet.text = quizBrain.getQuestionText()
        updateButtons()
        option1Outlet.backgroundColor = UIColor.clear
        option2Outlet.backgroundColor = UIColor.clear
        option3Outlet.backgroundColor = UIColor.clear
        progressOutlet.progress = quizBrain.getProgress()
        scoreOutlet.text = String("Score Is: \(quizBrain.getScore())")
    }
    
    func updateButtons(){
        option1Outlet.setTitle(quizBrain.getOption(o: 0), for: .normal)
        option2Outlet.setTitle(quizBrain.getOption(o: 1), for: .normal)
        option3Outlet.setTitle(quizBrain.getOption(o: 2), for: .normal)
    }
    
}

