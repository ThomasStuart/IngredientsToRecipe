//
//  DisplayDetailsViewController.swift
//  IngredientsToRecipe
//
//  Created by Thomas James Stuart on 5/11/19.
//  Copyright © 2019 Thomas James Stuart. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

struct instructionsData{
    var num:String
    var step:String
    
    init( i: String, s:String  ) {
        self.num = i
        self.step = s
    }
}

class MealsDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var instructionsTableView: UITableView!
    @IBOutlet weak var ingredientsTableView: UITableView!
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var InstructionsLabel: UILabel!
    

    var info:mealData?{
        didSet{
            guard let info = info else {return }
            //print(info.id)
        }
    }
    
    let one =   instructionsData(i:"1", s:"first")
    let two =   instructionsData(i:"2", s:"second")
    let three = instructionsData(i:"3", s:"three")
    
    var steps = [instructionsData]()
    var IngredientList = [String]()  //Array of strings (Arrays are dynamic in swift)
    var missing = [IngredientAndPic]()
    var used    = [IngredientAndPic]()
    var both    = [IngredientAndPic]()
   
    var stepCount = 0
    var imageUrl:String = ""
    var id:String = ""
    var nameOfRecipe:String = ""
    var recipeInstructions:String = ""
    var recipeURL:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetailedInstructions()
        getInstructions()
        
        print("Alex's id: \(id)")
        ingredientsTableView.dataSource = self
        ingredientsTableView.delegate = self
        //ingredientsTableView.register(UITableView.self, forCellReuseIdentifier: "IngredientDetailsTableViewCell")
       
        instructionsTableView.dataSource = self
        instructionsTableView.delegate = self
        //instructionsTableView.register(UITableView.self, forCellReuseIdentifier: "InstructionsTableViewCell")
        
        let posterUrl  = URL(string: imageUrl )
        mealImage.af_setImage(withURL:  posterUrl! )
        
        recipeName.text = nameOfRecipe
    

        for i in used{
            both.append(i)
        }
        for i in missing{
            both.append(i)
        }
       
        //steps.append(one)
        //steps.append(two)
        print( "the step count is ", steps.count)
        print(steps)
        
        ingredientsTableView.reloadData()
        instructionsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      if tableView == ingredientsTableView {
        return missing.count + used.count
      }
      else{
        return steps.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(tableView)
        if tableView == self.instructionsTableView {
           let CELL = tableView.dequeueReusableCell(withIdentifier: "InstructionsTableViewCell") as! InstructionsTableViewCell
           var instructionsInfo = steps[indexPath.row]
            
            CELL.number.text =  instructionsInfo.num
            CELL.instructionsLabel.text = instructionsInfo.step
            print("Step \(indexPath.row) is \(CELL.instructionsLabel.text)"  )
            return CELL
            
        }
        else if tableView == self.ingredientsTableView {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientDetailsTableViewCell") as! IngredientDetailsTableViewCell
        
        var IngredientInfo = both[indexPath.row]
        
        let iName      = IngredientInfo.ingredient as! String
        let imageURL   = IngredientInfo.imageURL  as! String
        let posterUrl  = URL(string: imageURL )
        
        let stringOfWords = iName
        let StringOfWordsArray = stringOfWords.components(separatedBy: " ")
        
        for word in StringOfWordsArray {
            for i in IngredientList {
                if word == i.lowercased() {
                    IngredientInfo.state = 1
                }
            }
        }
        
        if( IngredientInfo.state == 1 ){
            #colorLiteral(red: 0.8941, green: 1, blue: 0.8784, alpha: 1) /* #e4ffe0 */
            
             cell.backgroundColor  = UIColor(hue: 0.3083, saturation: 0.12, brightness: 1, alpha: 1.0) /* #e4ffe0 */
             cell.backgroundColor  = UIColor(hue: 111/360, saturation: 12/100, brightness: 100/100, alpha: 1.0) /* #e4ffe0 */
            
             cell.backgroundColor  = UIColor(red: 0.8941, green: 1, blue: 0.8784, alpha: 1.0) /* #e4ffe0 */
             cell.backgroundColor  = UIColor(red: 228/255, green: 255/255, blue: 224/255, alpha: 1.0) /* #e4ffe0 */
        }
        else if (IngredientInfo.state == 2 ){
            #colorLiteral(red: 1, green: 0.8784, blue: 0.8784, alpha: 1) /* #ffe0e0 */
            
            cell.backgroundColor  = UIColor(hue: 0, saturation: 0.12, brightness: 1, alpha: 1.0) /* #ffe0e0 */
            cell.backgroundColor = UIColor(hue: 0/360, saturation: 12/100, brightness: 100/100, alpha: 1.0) /* #ffe0e0 */
            
            cell.backgroundColor = UIColor(red: 1, green: 0.8784, blue: 0.8784, alpha: 1.0) /* #ffe0e0 */
            cell.backgroundColor = UIColor(red: 255/255, green: 224/255, blue: 224/255, alpha: 1.0) /* #ffe0e0 */
            
        }
        
        cell.ingredientName.text = iName
        cell.ingredientImage.af_setImage(withURL: posterUrl!)
        
        
        return cell
            
        }

        
         return UITableViewCell()
    }
    
    
    
    @IBAction func back(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    func getInstructions(){
        
        let parameters = RecipeRequest(info: ["ingredients": missing, "number": 10 ])
        var instructionUrl = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes"
        let inUrl = instructionUrl + "/" + id + "/information"
    
        Alamofire.request(inUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: parameters.getHeaders()).responseJSON(completionHandler: { (response) in
           
            if response.result.isSuccess {
                
                let recipeDetailJson : JSON = JSON(response.result.value!)
                let instructions = recipeDetailJson["instructions"].stringValue
                let sourceUrl = recipeDetailJson["sourceUrl"].stringValue
            
    
              self.recipeInstructions = instructions
            
                self.recipeURL = sourceUrl
                
                if( instructions == ""){
                    self.InstructionsLabel.text = sourceUrl
                }
                else{
                    self.InstructionsLabel.text = instructions
                }
                
            }
            
        })//End AlamoFireRequest
        
    }//END getInstructions
    
    
    func getDetailedInstructions(){
        
        let parameters = RecipeRequest(info: ["ingredients": missing, "number": 10 ])
        var instructionUrl = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes"
        let inUrl = instructionUrl + "/" + id + "/analyzedInstructions?stepBreakdown=true"
        
        print ( inUrl)
        
        Alamofire.request(inUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: parameters.getHeaders()).responseJSON(completionHandler: { (response) in
            
            //to get status code
            if let status = response.response?.statusCode {
                switch(status){
                case 201:
                    print("example success")
                default:
                    print("error with response status: \(status)")
                }
            }
            //to get JSON return value
            print("The response value is \(response.result.value) ")
            if let result = response.result.value {
                
                let array = (response.result.value as! NSArray).mutableCopy() as! NSMutableArray
                
                if let dictionary = array.firstObject as? [String:Any] {
                    
                    for (key, value) in dictionary{
                        
                        if( key == "steps"){
                            if let stepContainer =  value as? [[String:Any]] {
                                print ("count", stepContainer.count )
                                
                                for step in stepContainer{
                                    
                                    if let stp = step["step"] as? String {
                                        print("saved step", stp)
                                        let newStepEntry = instructionsData(i: String(self.stepCount), s: stp)
                                        self.stepCount = self.stepCount + 1
                                        self.steps.append(newStepEntry)
                
                                    }
                                }
                            }
                        }
                    }
                }
            }
            print(self.steps)
        })
         self.instructionsTableView.reloadData()
    }
    

    
    
}
