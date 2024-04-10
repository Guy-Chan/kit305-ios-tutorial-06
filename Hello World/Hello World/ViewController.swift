//
//  ViewController.swift
//  Hello World
//
//  Created by Lindsay Wells on 2/1/18.
//  Copyright © 2018 University of Tasmania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        // create an alert view
        let alert = UIAlertController(
            title: "Week 6!",
            message: "It's the tutorial session on week 6!",
            preferredStyle: UIAlertController.Style.actionSheet)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        print("Got to this part of the program")
        
        
    }
}
