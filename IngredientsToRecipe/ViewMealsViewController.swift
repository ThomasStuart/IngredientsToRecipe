//
//  ViewMealsViewController.swift
//  IngredientsToRecipe
//
//  Created by Thomas James Stuart on 5/7/19.
//  Copyright © 2019 Thomas James Stuart. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class ViewMealsViewController: UIViewController,  UICollectionViewDataSource,  UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var linkToMeals = ""
    var ingredientsArr = [String]()
    var meals          = [mealData]()
    //var stepCount = 0
    var instructionArray = [instructionsData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMeals()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing*2 )/2 // 3 represents the number of posters on a row
        layout.itemSize = CGSize(width: width , height: width )
        
        self.collectionView.reloadData()
    }
    
    func getMeals(){
    
        let parameters = RecipeRequest(info: ["ingredients": ingredientsArr, "number": 25 ])
        let findByIngredientsURL = APIservice(parameters, "findByIngredients").getPath()
            
        Alamofire.request(findByIngredientsURL, method: .get, parameters: parameters.getParameters(), encoding: URLEncoding.default, headers: parameters.getHeaders()).responseJSON { (response) in
            
            
             if response.result.isSuccess {
                
                let recipeJson : JSON = JSON(response.result.value!)
                
                
                for (key, subJson): (String, JSON) in recipeJson {
                    
                    let id = subJson["id"].stringValue
                    let title = subJson["title"].stringValue
                    let imageUrl = subJson["image"].stringValue
      
                    var missingIngredients = [IngredientAndPic]()
                    for (_, subJson): (String, JSON) in subJson["missedIngredients"] {
                        var newMissingIngredient: IngredientAndPic
                        newMissingIngredient = IngredientAndPic (ing: "", im: "", iNum: 0, i: 2)
                        newMissingIngredient.imageURL   = (subJson["image"].stringValue)
                        newMissingIngredient.ingredient =  (subJson["originalString"].stringValue)
                        newMissingIngredient.itemIdNum =  (subJson["id"].numberValue) as! Int
                        missingIngredients.append( newMissingIngredient )
                    }
                    
                    var includedIngredients = [IngredientAndPic]()
                    for (_, subJson): (String, JSON) in subJson["usedIngredients"] {
                         var newincludedIngredient: IngredientAndPic
                        newincludedIngredient = IngredientAndPic (ing: "", im: "",iNum: 0, i: 1)
                        newincludedIngredient.imageURL   = (subJson["image"].stringValue)
                        newincludedIngredient.ingredient =  (subJson["originalString"].stringValue)
                        newincludedIngredient.itemIdNum =  (subJson["id"].numberValue) as! Int
                        includedIngredients.append( newincludedIngredient  )
                    }
                    
                    
                    let mData = mealData(id: id, title: title, imageUrl: imageUrl, missingIngredients: missingIngredients, includedIngredients: includedIngredients)
                    self.meals.append(mData)
                    self.collectionView.reloadData()
                    
                }
            }
             else{
                print("error to request recipe json: ", response.error)
            }
            
            
            
        }// end of Alamofire network request

    }//end of getMeals method call
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealsViewCell", for: indexPath) as! MealsViewCell
        
        let meal = meals[indexPath.item]
        
        //IMAGE THROUGH URL
        let posterUrl  = URL(string: meal.imageUrl )
        cell.mealPic.af_setImage(withURL: posterUrl!)
 
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ){
     
        // Find the selected movie
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for:cell)!
        
        let meal = meals[indexPath.item]
        //getDetailedInstructions(missing: meal.missingIngredients, id: meal.id)
        
        let detailsViewController = segue.destination as! MealsDetailsViewController
        print( instructionArray.count, " before being transferred over ")
       
        //detailsViewController.steps = instructionArray
        
        detailsViewController.imageUrl     = meal.imageUrl
        detailsViewController.nameOfRecipe = meal.title
        detailsViewController.id           = meal.id
        detailsViewController.missing      = meal.missingIngredients
        detailsViewController.used         = meal.includedIngredients
        detailsViewController.info         = meal
        
        detailsViewController.IngredientList = ingredientsArr
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    

    /*
    func getDetailedInstructions(missing: [IngredientAndPic], id:String ){
        
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
                                        let newStepEntry =   instructionsData(i: String(self.stepCount), s: stp)
                                        self.stepCount = self.stepCount + 1
                                        self.instructionArray.append(newStepEntry)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        })
    }*/
    
}
