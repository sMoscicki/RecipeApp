import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading){
                
                //MARK: Recipe Image
                    Image(recipe.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 375, height: 150)
                        .padding([.leading, .trailing], 10)
                
                //MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                        .frame(width: 375)
                        .background(Color.gray.opacity(0.40))
                        .cornerRadius(25)
                    
                    ForEach(recipe.ingredients){ item in
                        
                        Text("•" + item.name)
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
                
                //MARK: Divider
                Divider()
                
                
                //MARK: Directions
                VStack(alignment: .leading){
                    Text("Direction")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                        .frame(width: 375)
                        .background(Color.gray.opacity(0.40))
                        .cornerRadius(25)
                    
                    
                    ForEach(0..<recipe.directions.count, id: \.self){ item in
                        Text(String(item+1) + ". " + recipe.directions[item])
                            .padding(.bottom, 5)
                        
                        
                    }
                    
                }
                .padding(.horizontal)
                
            }
            .padding([.leading, .trailing], 10)
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe and pass it into the detail view so that we can see a preview
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
