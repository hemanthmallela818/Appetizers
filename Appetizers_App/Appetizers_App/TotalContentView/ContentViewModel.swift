//
//  ContentViewModel.swift
//  appetizers hemanth's
//
//  Created by Nxtwave on 18/07/25.
//

import Foundation
import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    @Published var selected : Bool = false
    @Published var selectedfood : Recipe?
    @Published var orderedItem : [Recipe] = []
    @Published var TotalPrice : Double = 0.0
    @Published var recipes : [Recipe]? = nil
    
    
    func fetchData() {
        Task {
            do {
                self.recipes = try await NetworkManager.shared.getAppetizers()
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }

    

}
