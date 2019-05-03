//
//  TestRequestViewController.swift
//  IngredientsToRecipe
//
//  Created by Thomas James Stuart on 5/1/19.
//  Copyright © 2019 Thomas James Stuart. All rights reserved.
//

import UIKit

class TestRequestViewController: UIViewController {

    
    
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func executeRequest(_ sender: Any) {
        let test =  APIservice()
        
        
      self.textView.text = test.fetchRecipes()
        
    }
    
}
