//
//  API.swift
//  IngredientsToRecipe
//
//  Created by Thomas James Stuart on 4/24/19.
//  Copyright © 2019 Thomas James Stuart. All rights reserved.
//

import UIKit
import Alamofire

//step 0: set up private key
fileprivate let APIkey = "c1dd6b6606msh099f20a07a2831bp117e1djsndb6401443306"

class APIservice {

    var baseUrl = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes"
    var recipeRequest: RecipeRequest
    
    init(_ recipeRequest: RecipeRequest, _ path: String?) {
        self.recipeRequest = recipeRequest
        if let path = path {
            baseUrl = baseUrl + "/" + path
        }
    }
    
    func getPath() -> String {
        return baseUrl
    }
}


class RecipeRequest {

    var info: [String:Any] // dictionary of strings
    
    init(info: [String: Any]) {
        self.info = info
    }
    
    func getHeaders() -> HTTPHeaders {
        let xMashapeHost = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        let xMashapeKey = APIkey
        let headers: HTTPHeaders = [
            "X-Mashape-Host": xMashapeHost,
            "X-Mashape-Key": xMashapeKey,
        ]
        return headers
    }


    func getParameters() -> Parameters {
        var ingredientString = ""
        if let ingredients = info["ingredients"] as! [String]?  {
           
            for ingredient in ingredients {
                ingredientString = ingredientString + ingredient + ","
            }
            if !ingredientString.isEmpty {
                ingredientString.removeLast()
            }
            print("ingredientstring is ", ingredientString)
        }
        let numberOfIngredients = info["number"] ?? 20
        let parameters : Parameters = ["ingredients": ingredientString, "number": numberOfIngredients]
        return parameters
    }
}


class visualizeIngredientRequest {
    
    var idNumber: String // dictionary of strings
    
    init(ID: String ) {
        self.idNumber = ID
    }
    
    func getHeaders() -> HTTPHeaders {
        let xMashapeHost = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        let xMashapeKey = APIkey
        let headers: HTTPHeaders = [
            "X-Mashape-Host": xMashapeHost,
            "X-Mashape-Key": xMashapeKey,
        ]
        return headers
    }
    
    
    func getParameters() -> Parameters {
        let parameters : Parameters = ["ingredients": idNumber]
        return parameters
    }
}
