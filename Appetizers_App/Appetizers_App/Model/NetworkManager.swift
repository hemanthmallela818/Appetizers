//
//  NetworkManager.swift
//  appetizers hemanth's
//
//  Created by Nxtwaves Mac mini-4 on 09/08/25.
//
//
//  Networkmanager.swift
//  Food Delivery App Hemanth's
//
//  Created by Nxtwaves Mac mini-4 on 07/08/25.
//

import Foundation
import SwiftUI

final class NetworkManager {
    
    private let cache = NSCache<NSString, UIImage>()
    static let shared = NetworkManager()
    static let  baseURL = "https://dummyjson.com/recipes"
    
    
    private init() { }
    
    
    func getAppetizers() async throws -> [Recipe] {
        
        guard let url = URL(string : NetworkManager.baseURL) else {
            throw APError.invalidURL
        }
        
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Welcome.self, from: data).recipes
        } catch {
            throw APError.invalidData
        }
    }
    
    
    func loadImage(from urlString: String) async -> UIImage? {
        if let cached = cache.object(forKey: urlString as NSString) {
            return cached
        }
        
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            do {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    if let image = UIImage(data: data) {
                        cache.setObject(image, forKey: urlString as NSString)
                        return image
                    }
                } catch {
                    print("Image load error:", error)
                }
                
                return nil
            }
            
        }
    }
}

enum APError : Error {
    case invalidURL
    case invalidData
}

