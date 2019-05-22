//
//  mealData.swift
//  IngredientsToRecipe
//
//  Created by Thomas James Stuart on 5/9/19.
//  Copyright © 2019 Thomas James Stuart. All rights reserved.
//

import Foundation


struct mealData{
  
    var id:String
    var title:String
    var imageUrl:String
    var missingIngredients = [IngredientAndPic]()
    var includedIngredients = [IngredientAndPic]()
    
    init(id: String, title:String , imageUrl:String,  missingIngredients: [IngredientAndPic], includedIngredients:[IngredientAndPic] ) {
        
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.missingIngredients = missingIngredients
        self.includedIngredients = includedIngredients
    }
 
    //INSTRUCTIONS
}


struct IngredientAndPic{
    
    var ingredient:String
    var imageURL:String
    var itemIdNum:Int
    var state:Int
    
    init( ing: String, im:String, iNum:Int, i:Int  ) {
        
        self.ingredient = ing
        self.imageURL = im
        self.itemIdNum = iNum
        self.state = i
    }
    
    //INSTRUCTIONS
}
