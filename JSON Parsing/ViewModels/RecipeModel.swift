import Foundation


class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    
    init() {
        
       //Create an instance of data service and get the data
        recipes.self = DataService().getLocalData()
        
    }
    
}
