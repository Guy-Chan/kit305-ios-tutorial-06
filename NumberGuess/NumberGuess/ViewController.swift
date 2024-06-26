//
//  ViewController.swift
//  NumberGuess
//
//  Created by Lindsay Wells on 2/1/18.
//  Copyright © 2018 University of Tasmania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessField: UITextField!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var firstResponseLabel: UILabel!
    @IBOutlet weak var secondResponseLabel: UILabel!

    // some member variables for the game
    var secretNumber:Int = 0
    var guessCount:Int = 0
    var finished:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetGame();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func enterTapped(_ sender: UIButton)
    {
        if(finished) {
            return;
        }
        if let enteredGuess:Int = Int(guessField.text!)
        {
            print("Guess Entered");
            print(enteredGuess);
            
            if enteredGuess > secretNumber
            {
                firstResponseLabel.text = "Too high - please try again!"
            }
            else if enteredGuess < secretNumber
            {
                firstResponseLabel.text = "Too low - please try again!"
            }
            
            if (enteredGuess == secretNumber)
            {
                finished = true;
                guessField.isEnabled = false;
//                firstResponseLabel.text = "That's correct - in \(guessCount) tries!"
//                secondResponseLabel.text = "Tap Reset to play again."
                // create an alert view
                let alert = UIAlertController(
                                title: "Correct!",
                                message: "You guessed in \(guessCount) tries!",
                                preferredStyle: UIAlertControllerStyle.alert)
                                
                // add an action (button)
                alert.addAction(UIAlertAction(
                                title: "Cool!",
                                style: UIAlertActionStyle.cancel,
                                handler: nil))
                                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                guessCount = guessCount + 1
                tryCountLabel.text = String(guessCount)
            }
        }
        else
        {
            print("No guess entered");
        }
        
        guessField.text = ""
       
    }
    @IBAction func resetTapped(_ sender: UIButton)
    {
        finished = false;
        guessField.isEnabled = true;
        resetGame()
    }
    
    func resetGame()
    {
        print("The game has been reset...")
        
        secretNumber = Int(arc4random() % 1000)
        print("some text, and then an integer \(secretNumber) like this")
        guessCount = 1
        
        tryCountLabel.text = String(guessCount)
        firstResponseLabel.text = ""
        secondResponseLabel.text = ""
        guessField.text = ""
    }
}

