//
//  ViewController.swift
//  Project 2
//
//  Created by Ednan R. Frizzera Filho on 14/04/23.
//

import UIKit

class ViewController: UIViewController {

// MARK: - IBOutlets
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
// MARK: - Properties
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var answeredQuestions = 0

// MARK: - Set up
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        // We can use either countries.append or += to add elements to the array.
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        /* We can't put the property .lightGray directly into the borderColor, because it belongs to a CA layer, which doesn't know where UIColor is
        that's why .cgColor is needed, to convert to a cgColor. */
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        button1.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        // .contentInsets tells the distance from the button content area to its bounds.
        button2.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button3.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        askQuestion()
    }

// MARK: - IBActions
    @IBAction func buttonTapped(_ sender: UIButton) {
    // IBAction = action in linked buttons from storyboard triggers the function.
        var title: String
        // Extra challenge 3: requires to declare a new variable, this way customizing the if else is possible.
        let number = sender.tag
        
        if number == correctAnswer {
            title = "Correct! That's the flag of \(countries[number].uppercased())."
            score += 1
        } else {
            title = "Wrong! That's the flag of \(countries[number].uppercased())."
            score -= 1
        }
        
        answeredQuestions += 1
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        // Creates an alert. Creating a constant is needed to make the alert exist.
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        // Adds an action to the alert.
        
        if answeredQuestions <= 9 {
            present(ac, animated: true)
        } else {
            finishedGame()
            resetAnsweredQuestions()
            resetScore()
        }
    }
// MARK: - Functions
    
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        // This will shuffle the array, so the flags will be different each time, even if we always call for index 0, 1 and 2.
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage (named: countries[0]), for: .normal)
        // .setImage assigns a new image to the button.
        // .normal means the normal state for button1 in this case.
        button2.setImage(UIImage (named: countries[1]), for: .normal)
        button3.setImage(UIImage (named: countries[2]), for: .normal)
        
        // EXTRA CHALLENGE 1: Try showing the player’s score in the navigation bar, alongside the flag to guess.
        title = "Which is the flag of \(countries[correctAnswer].uppercased())? | Score: \(score)"
    }
    
    
    func finishedGame() {
        let finished = UIAlertController(title: "Finished!", message: "Your final score is \(score).", preferredStyle: .alert)
        finished.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestion))
        
        answeredQuestions = 10
            present(finished, animated: true)
    }
    
    
    func resetAnsweredQuestions() {
        answeredQuestions = 0
    }
    
    
    func resetScore() {
        score = 0
    }
    
    
}
