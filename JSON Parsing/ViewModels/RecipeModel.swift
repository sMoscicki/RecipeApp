import Foundation


class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
       //Create an instance of data service and get the data
        recipes.self = DataService().getLocalData()
        
    }
    
    static func getPortion(ingradient:Ingredient, recipeServing: Int, targetSevings: Int) -> String{
        
        var portion = ""
        var numerator = ingradient.num ?? 1
        var denominator = ingradient.denom ?? 1
        var wholePortions = 0
        
        if ingradient.num != nil {
            
            //Get a single serving size by multiplying denominator by the recipe servings
    
            denominator *= recipeServing
            //Get a target portion by multiplaying numerator by target servings
            numerator *= targetSevings
            
            //Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //Get the whole portion if numerator > denominator
            if numerator >= denominator {
                
                //Calculated whole portions
                wholePortions = numerator / denominator
                
                //Calculated the remainder
                numerator = numerator % denominator
                
                //Assign to portion string
                portion += String(wholePortions)
                
            }
            
            //Express the remainder as a fraction
            if numerator > 0 {
                
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingradient.unit {
            
            if wholePortions > 1{
                
                
                //Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }else if unit.suffix(1) == "f"{
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }
            
            portion += ingradient.num == nil && ingradient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        
        return portion
    }
}
