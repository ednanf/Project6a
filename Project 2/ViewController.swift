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

    func askQuestion() {
        button1.setImage(UIImage (named: countries[0]), for: .normal)
        // .setImage assigns a new image to the button.
        // .normal means the normal state for button1 in this case.
        button2.setImage(UIImage (named: countries[1]), for: .normal)
        button3.setImage(UIImage (named: countries[2]), for: .normal)
    }
}
