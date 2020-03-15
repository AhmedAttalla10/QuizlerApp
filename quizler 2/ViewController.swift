//
//  ViewController.swift
//  quizler 2
//
//  Created by hima attalla on 6/13/19.
//  Copyright © 2019 ahmed attalla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionNum: UILabel!
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet var progressLabel: UIView!
    @IBOutlet weak var question: UILabel!
    let questionBank = QuestionList()
    var num = 0
    var pickedAnswer = true
    var scoreNum = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        question.text = questionBank.list[num].question
        questionNum.text = "\(num + 1) / 13"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func buttonPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
            
            
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        nextQuestion()
        
        
    }
    func nextQuestion() {
        num += 1
        if num <= 12 {
            
            question.text = questionBank.list[num].question
            questionNum.text = "\(num + 1) / 13"
        }
        else {
            
            let alert = UIAlertController(title: "good", message: "you've already finished", preferredStyle: .alert)
//            let restartAction = UIAlertAction(title: "Restart", style: .default) { ( UIAlertAction ) in
//                self.num = 0
//                self.question.text = self.questionBank.list[self.num].question
//                self.questionNum.text = "\(self.num + 1) / 13"
//                self.scoreNum = 0
//            }
            let restart = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.num = 0
                              self.question.text = self.questionBank.list[self.num].question
                            self.questionNum.text = "\(self.num + 1) / 13"
                                self.scoreNum = 0
                self.score.text = "score: \(self.scoreNum)"
            
            }
            
            
           // score.text = "score: \(scoreNum)"
            alert.addAction(restart)
            present(alert, animated: true, completion: nil)
            
        }
    }
    func checkAnswer() {
        var answer = questionBank.list[num].answer
        if answer==pickedAnswer {
            scoreNum += 1
            score.text = "score: \(scoreNum)"
            print("you're true")
        }
        else {
            print("you're wrong")
        }
    }
}

