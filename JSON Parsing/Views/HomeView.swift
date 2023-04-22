//
//  HomeView.swift
//  JSON Parsing
//
//  Created by s.Moscicki on 21/04/2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        VStack{
            
            List(model.recipes){ r in
                
                VStack(alignment: .leading){
                
                    Text(r.name)
                        .font(.title)
                    Text(r.cuisine)
                }
            }
            
            Button("Add Recipe"){
                model.addRecipe()
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
