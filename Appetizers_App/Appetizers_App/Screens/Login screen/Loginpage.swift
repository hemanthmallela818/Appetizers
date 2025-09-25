//
//  Loginpage.swift
//  appetizers hemanth's
//
//  Created by Nxtwaves Mac mini-4 on 09/08/25.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    
    @State var emaill: String  = ""
    @State var login : Bool = false
    @State var isthereErrors : Bool = false
    @StateObject var viewmodel  = GoogleAuthViewModel()
    
    var body: some View {
        NavigationStack{
            
//            if viewmodel.profile != nil {
//                ContentView(details: viewmodel)
//                    .navigationBarBackButtonHidden(true)
//
//                
//            } else {
                ZStack {
                    LinearGradient(gradient: Gradient(stops: [.init(color: .lightgreen, location: 0.1),.init(color: .darkgreen, location: 0.9)]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        TextField("Enter your Email", text: $emaill)
                            .foregroundColor(.black)
                            .padding(.horizontal, 20)
                            .frame(width: 350, height: 50)
                            .background(Color.white)
                            .cornerRadius(20)
                        
                        Button {
                            if emaill.contains("@gmail.com"){
                                login = true }
                            else{
                                    isthereErrors = true
                                }
                        } label: {
                            Text("Sign up")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(Color.buttoncolor)
                                .cornerRadius(20)
                        }
                        
                        GoogleSignInButton{
                            Task {
                                await viewmodel.signIn()
                            }
                        }
                        .frame(width: 200, height: 60)
                        .cornerRadius(20)
                        
                        if let errorMessage = viewmodel.errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        } else if isthereErrors {
                            Text("Check Your Email..!")
                                .font(.system(size: 30))
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        
                       
                            Spacer()
                        
                            VStack(spacing: 10){
                                Text("Already have an account?")
                                    .foregroundStyle(Color.white)
                                Button {
                                    login = true
                                } label: {
                                    Text("Log In")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 150, height: 50)
                                        .background(Color.buttoncolor)
                                        .cornerRadius(20)
                                }
                            }
                        
                    }
                    .navigationDestination(isPresented: $login) {
                        ContentView()
                            .navigationBarBackButtonHidden(true)
                    }
                }
                
            }
            
        }
    }
//}


#Preview {
    LoginView()
}

