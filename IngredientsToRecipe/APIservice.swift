//
//  API.swift
//  IngredientsToRecipe
//
//  Created by Thomas James Stuart on 4/24/19.
//  Copyright © 2019 Thomas James Stuart. All rights reserved.
//

import UIKit
import Alamofire

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}


/*
 
unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?number=5&ranking=1&ignorePantry=false&ingredients=apples%2Cflour%2Csugar")
 .header("X-RapidAPI-Host", "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com")
 .header("X-RapidAPI-Key", "52a65f79d9mshf3638a700050f05p1d3d73jsn9ae4d4ee2574")
 .end(function (result) {
 console.log(result.status, result.headers, result.body);
 });
 
 
unirest.post("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/visualizeIngredients")
    .header("X-RapidAPI-Host", "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com")
    .header("X-RapidAPI-Key", "52a65f79d9mshf3638a700050f05p1d3d73jsn9ae4d4ee2574")
    .header("Accept", "text/html")
    .header("Content-Type", "application/x-www-form-urlencoded")
    .send("defaultCss=false")
    .send("measure=metric")
    .send("view=grid")
    .send("showBacklink=false")
    .send("ingredientList=3 oz flour")
    .send("servings=2")
    .end(function (result) {
        console.log(result.status, result.headers, result.body);
    });
 
 
*/

class APIservice {

    //step 0: set up private key
    fileprivate let APIkey = "c1dd6b6606msh099f20a07a2831bp117e1djsndb6401443306"
                            // 52a65f79d9mshf3638a700050f05p1d3d73jsn9ae4d4ee2574  (possibly other one)
    //step 1: set up the base URL
    let baseUrl = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?ingredients="
    
    //step 2: get the REQUIRED parameters for the method call
    // get the parameters for a Ingredients to Recipes request
    
    /*var recipeRequest: RecipeRequest
    init(_ rRequest: RecipeRequest) {
        self.recipeRequest = rRequest
    }*/
    
    func getHeaders() -> HTTPHeaders {
        let xMashapeHost = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        let xMashapeKey = "c1dd6b6606msh099f20a07a2831bp117e1djsndb6401443306"
        let headers: HTTPHeaders = [
            "X-Mashape-Host": xMashapeHost,
            "X-Mashape-Key": xMashapeKey,
        ]
        return headers
    }
    
    func toParameters() -> Parameters {
        
        let parameters: Parameters = [
            // .../findByIngredients?ingredients=apples%2Cflour%2Csugar
            //"ingredients": ["apples","flour","sugar"]
            "%2C": ["apples","flour","sugar"]
        ]
        
        return parameters
    }
    
    
    
    
    func fetchRecipes() -> String{
      
            //let parameters = recipeRequest.toParameters()
            //let headers = recipeRequest.getHeaders()
            
            let parameters = toParameters()
            let headers    = getHeaders()
        
            //Desired URL: .../findByIngredients?number=5&ranking=1&ignorePantry=false&ingredients=apples%2Cflour%2Csugar
        
            // JSONEncoding.default || URLEncoding.default  || URLEncoding.httpBody
        guard let url = URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?ingredients=apples%2Cflour%2Csugar") else {
            return "Error with URL"
        }
        
            //Alamofire.request( baseUrl, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON {
            Alamofire.request( url, method: .get, encoding: URLEncoding.default, headers: headers).responseJSON { response in
                
                guard response.result.isSuccess,
                    let value = response.result.value else {
                        print("Error while fetching ingredients: \(String(describing: response.result.error))")
                        return
                }
                 debugPrint(response)
            }
        
        return "success"
    }
    
}


class RecipeRequest {
    
    
    /*var Recipes: [[String]]
    
    init(recipes: [[String]]) {
        self.Recipes = recipes
    }*/
    
    func getHeaders() -> HTTPHeaders {
        let xMashapeHost = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        let xMashapeKey = "c1dd6b6606msh099f20a07a2831bp117e1djsndb6401443306"
        let headers: HTTPHeaders = [
            "X-Mashape-Host": xMashapeHost,
            "X-Mashape-Key": xMashapeKey,
        ]
        return headers
    }
    
    func toParameters() -> Parameters {
        
        let parameters: Parameters = [
            "findByIngredients": ["apples","flour","sugar"]
        ]
        
        return parameters
    }
    
}
