//
//  Appetizers detailed view.swift
//  appetizers hemanth's
//
//  Created by Pavan Dharma on 03/07/25.
//
import Foundation
import SwiftUI

struct AppetizersDetailedView: View {
   var selectedfooditem : Recipe
    
    @Binding var orderedItem : [Recipe]
    @Binding var TotalPrice : Double
    @Binding var selected : Bool
    var body: some View {
        Spacer()
        VStack{
            HStack{
                Spacer()
                Button {
                    selected = false
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 40, height: 40)
                        .background(Color.black)
                        .cornerRadius(30)
                        .foregroundColor(.white)
                        .padding(.trailing, 30)
                        .padding(.bottom, 10)
                }
                
            }
            
            AsyncImage(url: URL(string: selectedfooditem.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 250, height: 250)
            .padding()

//            AppetizerRemoteImage(urlString: selectedfooditem.image)
//                .frame(width: 250, height: 250)
            Text(selectedfooditem.name)
                .font(.system(size: 30, weight: .bold))
            
            Text(selectedfooditem.cuisine)
                .font(.system(size: 20, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.top, 10)
                .padding(.bottom, 10)
            HStack(spacing: 30){
                VStack{
                    Text("Calories")
                    Text("\(selectedfooditem.cuisine)")
                }
                VStack{
                    Text("Carbohydrates")
                    Text("\(selectedfooditem.reviewCount)")
                }

                VStack{
                    Text("Protines")
                    Text("\(selectedfooditem.reviewCount)")
                }

               
                
              
            }
            Button {
                orderedItem.append(selectedfooditem)
                TotalPrice = Double(orderedItem.reduce(0) { $0 + $1.caloriesPerServing })
                
            } label: {
                Text("Order Now")
                    .frame(width: 200, height: 50)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }.padding(.top, 20)

            
        
        }
        .frame(width: 370, height: 580)
        .background(Color.whitegreen)
        .cornerRadius(60)
        Spacer()
        
        
    }
}

#Preview {
    AppetizersDetailedView(selectedfooditem: Recipe(id: 1, name: "Sample Food", ingredients: ["Chicken", "Salt"], instructions: ["Mix", "Cook"], prepTimeMinutes: 10, cookTimeMinutes: 20, servings: 2, difficulty: .easy, cuisine: "Indian", caloriesPerServing: 250, tags: ["Tag1"], userID: 1, image: "", rating: 4.5, reviewCount: 100, mealType: ["Lunch"]), orderedItem: .constant([]), TotalPrice: .constant(0), selected: .constant(false))
}
