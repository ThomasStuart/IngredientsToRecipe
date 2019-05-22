//
//  InputIngredientsViewController.swift
//  IngredientsToRecipe
//
//  Created by Thomas James Stuart on 5/4/19.
//  Copyright © 2019 Thomas James Stuart. All rights reserved.
//

import UIKit
import InputBarAccessoryView

class InputIngredientsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, InputBarAccessoryViewDelegate {

     var IngredientList = [String]()  //Array of strings (Arrays are dynamic in swift)
     //var IngredientList = ["apple","flour","sugar"]
    @IBOutlet weak var tableView: UITableView!
    
    lazy var addBar : InputBarAccessoryView = {
        let bar = InputBarAccessoryView()
        bar.inputTextView.placeholder = "new ingredient item"
        bar.sendButton.title = "Add"
        //bar.setStackViewItems([], forStack: .bottom, animated: true)
        return bar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        addBar.delegate = self
        setUpNavigationItems()
    }
    
    override var inputAccessoryView: UIView? {
        return addBar
    }
    
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    
    fileprivate func setUpNavigationItems() {
     //   navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(handleSubmit))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IngredientList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientTableViewCell") as! IngredientTableViewCell
      
      let Ingredient = IngredientList[indexPath.row]
      let iName      = Ingredient as! String
      
    
      cell.ingredientName.text = iName
        
      return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            IngredientList.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    

    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        IngredientList.append( inputBar.inputTextView.text)
        tableView.reloadData()
        addBar.inputTextView.text = nil
    }
    
    
    @IBAction func submit(_ sender: Any) {
        print("I just hit SUBMIT")
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any? ){
        //  send link to the next view controller
        let detailsViewController = segue.destination as! ViewMealsViewController
        detailsViewController.ingredientsArr = IngredientList
    }
    
    
}
