//
//  Orders page.swift
//  appetizers hemanth's
//
//  Created by Nxtwave on 16/07/25.
//

import Foundation
import SwiftUI

struct OrdersPage: View {
    @Binding var orderedItem: [Recipe]
    @Binding var TotalPrice: Double
    @State var quantity : Int
    
    private func removeItem(_ item: Recipe) {
        if let index = orderedItem.firstIndex(where: { $0.id == item.id }) {
            orderedItem.remove(at: index)
            TotalPrice = Double((orderedItem.reduce(0) { $0 + $1.caloriesPerServing}))
        }
    }
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(stops: [.init(color: .lightgreen, location: 0.5),.init(color: .whitegreen, location: 0.8)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            VStack {
                ScrollView{
                    VStack(alignment: .leading, spacing: 20){
                        Text("Order Items")
                            .font(.system(size: 40))
                            .padding(.bottom,20)
                            .padding(.top,20)
                            
                        
                        ForEach($orderedItem, id: \.id) { $item in
                            OrderView(orderedItem: $item,quantity: $quantity, onRemove: { removeItem(item)}).onChange(of: quantity) { _, newValue in
                                if newValue == 0 {
                                    removeItem(item)}else{
                                        TotalPrice = Double(item.caloriesPerServing * quantity)
                                }
                            }
                        }
                        
                    }
                    
                }
                
                Text("Total Price: \(TotalPrice, specifier:"%.2f")")
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.bottom,20)
            }
        }
    }
}

#Preview {
    OrdersPage(orderedItem: .constant([]), TotalPrice: .constant(0.0), quantity: 5)
}
