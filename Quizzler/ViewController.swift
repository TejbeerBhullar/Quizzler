//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()       // will create instance of question bank class that has all the questions
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0  // State as to which question is the user on
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[0] // will give the first question (class: Question) from the list of the QuestionBank class
        questionLabel.text = firstQuestion.questionText  // this will display the question of the object firstQuestion to the lable questionLabel
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        }
        else if sender.tag == 2{
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber += 1
        
        nextQuestion()
        
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12{
            questionLabel.text = allQuestions.list[questionNumber].questionText}
        else {
            let alert = UIAlertController(title: "Awesome", message: "Do you want to start again", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
            {(UIAlertAction) in self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            startOver()
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if pickedAnswer == correctAnswer{
            print("You have got it")
        }else{
            print("sorry, it's wrong")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        nextQuestion()
    }
    

    
}
