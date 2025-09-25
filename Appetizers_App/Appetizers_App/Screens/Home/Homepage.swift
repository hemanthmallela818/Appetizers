//
//  Homepage.swift
//  appetizers hemanth's
//
//  Created by Pavan Dharma on 02/07/25.
//

import Foundation
import SwiftUI

struct Homepage: View {
    
    @Binding var selected : Bool
    @Binding var selectedfood : Recipe?
    @Binding var OrderedItem : [Recipe]
    @Binding var TotalPrice : Double
    @Binding var recipes : [Recipe]? 
    @State var searchText : String = ""
   
    var body: some View {
        
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(stops: [.init(color: .whitegreen, location: 0.5),.init(color: .lightgreen, location: 0.9)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack{
                    List(recipes ?? [], id: \.id){recipe in
                        AppetizerView(appetizer: recipe)
                            .onTapGesture {
                                selected.toggle()
                                selectedfood = recipe
                            }
                            .listRowBackground(Color.clear)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Appetizers")
            .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "Search your food")
        }
        .blur(radius: selected ? 70 : 0)
        .overlay{
            if selected {
                if let selectedfood = selectedfood {
                    AppetizersDetailedView(selectedfooditem: selectedfood, orderedItem: $OrderedItem, TotalPrice: $TotalPrice, selected: $selected)
                }
            }
        }
    }
}
    
#Preview {
    let sampleRecipe = Recipe(
        id: 1,
        name: "Sample Food",
        ingredients: ["Chicken", "Salt"],
        instructions: ["Mix", "Cook"],
        prepTimeMinutes: 10,
        cookTimeMinutes: 20,
        servings: 2,
        difficulty: .easy,
        cuisine: "Indian",
        caloriesPerServing: 250,
        tags: ["Tag1"],
        userID: 1,
        image: "",
        rating: 4.5,
        reviewCount: 100,
        mealType: ["Lunch"]
    )
    Homepage(selected: .constant(false), selectedfood: .constant(sampleRecipe), OrderedItem: .constant([sampleRecipe]), TotalPrice: .constant(0), recipes: .constant([sampleRecipe] as [Recipe]?))
}

