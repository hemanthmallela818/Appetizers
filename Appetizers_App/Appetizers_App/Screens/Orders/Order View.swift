//
//  Order View.swift
//  appetizers hemanth's
//
//  Created by Nxtwave on 16/07/25.
//

import Foundation
import SwiftUI


struct OrderView: View {
     @Binding var orderedItem : Recipe
     @Binding var quantity : Int
    
    
     var onRemove: () -> Void
    
    var body: some View {
        
            HStack{
                AppetizerRemoteImage(urlString: orderedItem.image)
                    .frame(width: 100, height: 90)
                    .padding(.trailing, 5)
                    .padding(.leading, 25)
                VStack(alignment: .leading){
                    Text(orderedItem.name)
                        .font(.system(size: 20))
                        .padding(.bottom,5)
                        .foregroundStyle(Color.white)
                    Text("\(orderedItem.caloriesPerServing)")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.white)
                    
                }
                
                VStack {
                    Text("\(quantity)")
                        .foregroundStyle(Color.white)
                        .padding(.leading, 55)

                    Stepper("",value: $quantity, in: 0...10)
                        .padding(.trailing)
                        .foregroundStyle(Color.white)
                    
                }
                
            }
            .frame(width: 395, height: 130)
            .background(Color.lightgreen1)
            .cornerRadius(20)
            
        
    }
}

#Preview {
    OrderView(orderedItem: .constant(Recipe(id: 1, name: "Sample", ingredients: [], instructions: [], prepTimeMinutes: 0, cookTimeMinutes: 0, servings: 1, difficulty: .easy, cuisine: "Indian", caloriesPerServing: 100, tags: [], userID: 0, image: "", rating: 5.0, reviewCount: 10, mealType: [])), quantity: Binding.constant(1), onRemove: {})
}
