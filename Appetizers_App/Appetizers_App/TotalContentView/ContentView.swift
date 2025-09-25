//
//  ContentView.swift
//  appetizers hemanth's
//
//  Created by Pavan Dharma on 02/07/25.
//

import SwiftUI

struct ContentView: View {
    
   @StateObject var viewModel = ContentViewModel()
   @ObservedObject var details = GoogleAuthViewModel()
   @EnvironmentObject var userDetails: Order

    
    var body: some View {
        
        TabView{
            Homepage( selected: $viewModel.selected, selectedfood: $viewModel.selectedfood, OrderedItem: $viewModel.orderedItem, TotalPrice: $viewModel.TotalPrice, recipes: $viewModel.recipes)
                .onAppear {
                    if let name = details.profile?.name, let email = details.profile?.email {
                        userDetails.name = name
                        userDetails.email = email
                    }
                }
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem{
                    Image(systemName: "person.crop.circle")
                    Text("Account")
                }
            OrdersPage(orderedItem: $viewModel.orderedItem, TotalPrice: $viewModel.TotalPrice, quantity: 1)
                .tabItem{
                    Image(systemName: "cart")
                    Text("Orders")
                }
        }
        .task {
            viewModel.fetchData()
        }
        

        
    }
}

#Preview {
    ContentView()
}
    
