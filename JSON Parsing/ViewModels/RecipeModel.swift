import Foundation


class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init(){
    
        //Get the path to find the json file within the app bundle
       let pathString =  Bundle.main.path(forResource: "data", ofType: "json")
        
        if let path = pathString{
            
            //Create a url object
            let url = URL(filePath: path)
            
            // Error handling
            
            do{
                //Put the code that potentially throws error
                
                //Create a data objcet with the data at the url
                let data = try Data(contentsOf: url)
                
                //Parse the date
                let decoder = JSONDecoder()
                
                do{
                   let recipeDate = try decoder.decode([Recipe].self, from: data)
                    
                    //Set unique IDs for each instance
                    for r in recipeDate {
                        
                        r.id = UUID()
                    }
                    
                    
                    //Assign the data to the published property
                    self.recipes = recipeDate
                }catch{
                    print(error)
                }
                
                
            }
            catch{
                //Execution will come hre if an error is thrown
                //Handle the error
                print(error)
            }
            
           
        }
        
        
    }
    
    func addRecipe(){
        
        
        
    }
    
    
}
