import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading){
                
                //MARK: Recipe Image
                    Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                //MARK: Serving Size Picker
                VStack(alignment: .leading){
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir", size: 15))

                    Picker("", selection: $selectedServingSize){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .font(Font.custom("Avenir", size: 15))
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                
                //MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                        .frame(width: 375)
                        .background(Color.gray.opacity(0.40))
                        .cornerRadius(25)
                    
                    ForEach(recipe.ingredients){ item in
                                        
                        Text("•" + RecipeModel.getPortion(ingradient: item, recipeServing: recipe.servings, targetSevings: selectedServingSize) + " " + item.name.lowercased())
                            .padding(.bottom, 1)
                            .font(Font.custom("Avenir", size: 15))

                    }
                }
                .padding(.horizontal)
                
                //MARK: Divider
                Divider()
                
                
                //MARK: Directions
                VStack(alignment: .leading){
                    Text("Direction")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                        .frame(width: 375)
                        .background(Color.gray.opacity(0.40))
                        .cornerRadius(25)
                    
                    
                    ForEach(0..<recipe.directions.count, id: \.self){ item in
                        Text(String(item+1) + ". " + recipe.directions[item])
                            .padding(.bottom, 5)
                            .font(Font.custom("Avenir", size: 15))
                        
                        
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
            .environmentObject(RecipeModel())
    }
}
