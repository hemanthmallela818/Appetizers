//
//  Appetizers_AppApp.swift
//  Appetizers_App
//
//  Created by Nxtwaves Mac mini-4 on 25/09/25.
//

import SwiftUI
import Combine
import GoogleSignIn
import GoogleSignInSwift
import UIKit

@main
struct Appetizers_AppApp: App {
    @StateObject  var order = Order()
    
    var body: some Scene {
        WindowGroup {
           LoginView()
                .environmentObject(order)
                .onAppear{
                    // Restore previous session if available
                    GIDSignIn.sharedInstance.restorePreviousSignIn { _, _ in }
                }
                .onOpenURL { url in
                          // Handle redirect
                          GIDSignIn.sharedInstance.handle(url)
                        }
        }
    }
}

class Order: ObservableObject {
    
    @Published var items: [Any] = []
    @Published var name : String = ""
    @Published var email : String = ""
      
    
}



extension UIApplication {
  static var topViewController: UIViewController? {
    guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let root = scene.windows.first(where: { $0.isKeyWindow })?.rootViewController
    else { return nil }
    var top = root
    while let presented = top.presentedViewController {
      top = presented
    }
    return top
  }
}
