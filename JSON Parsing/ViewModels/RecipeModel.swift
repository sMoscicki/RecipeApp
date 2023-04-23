import Foundation


class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
       //Create an instance of data service and get the data
        recipes.self = DataService().getLocalData()
        
    }
    
    static func getPortion(ingradient:Ingredient, recipeServing: Int, targetSevings: Int) -> String{
        
        
        
        return String(targetSevings)
    }
}
