//
//  AppetizerDetailedView.swift
//  appetizers hemanth's
//
//  Created by Pavan Dharma on 02/07/25.
//

import Foundation
import SwiftUI

struct AppetizerView: View {
    let appetizer: Recipe
    var body: some View {
        HStack{

            AppetizerRemoteImage(urlString: appetizer.image)
                .frame(width: 100, height: 100)
                .padding(.trailing)
                .padding(.leading, 30)
                .cornerRadius(30)
            
            VStack(alignment: .leading){
                Text(appetizer.name)
                    .foregroundStyle(.white)
                    .font(.system(size: 23, weight: .bold, design: .default))
                    
                Text("$\(appetizer.caloriesPerServing)")
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .padding(.bottom, 8)
            }
            Spacer()
            
            
        }
        .frame(width: 370, height: 120)
        .background(Color.lightgreen1)
        .cornerRadius(35)
        .padding(10)
        
    }
}
#Preview {
    AppetizerView(appetizer: Recipe(
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
    ))
}
