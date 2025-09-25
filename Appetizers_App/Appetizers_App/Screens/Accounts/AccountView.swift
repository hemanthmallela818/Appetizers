//
//  AccountView.swift
//  appetizers hemanth's
//
//  Created by Pavan Dharma on 02/07/25.
//

import Foundation
import SwiftUI
import Combine

struct AccountView: View {
    @StateObject var viewModel = GoogleAuthViewModel()
    @State var birthdate : Date = Date()
    @State var  extranapkins : Bool = false
    @EnvironmentObject var userDetails: Order

    var body: some View {
        VStack{
            Form{
                Section(header: Text("Account")
                    .font(.system(size: 45, weight: .bold))
                    .padding(.top, 90)) {}
                
                
                Section(header: Text("Personal Details")) {
                    
                    if !userDetails.name.isEmpty {
                        Text(userDetails.name)
                        Text(userDetails.email)
                    } else {
                        TextField("Name", text: .constant(""))
                        TextField("Email", text: .constant(""))
                    }

                    TextField("Phone Number", text: .constant(""))
                    
                    DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)
                    Button {
                        print(birthdate)
                    } label: {
                        Text("Save changes")
                            .foregroundStyle(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.green)
                            .cornerRadius(25)
                        
                    }
                }
                Section(header: Text("Address")) {
                    TextField("Address", text: .constant(""))
                }
                Section(header: Text("Requests")){
                    Toggle(isOn: $extranapkins) {
                        Text("Extra Napkins")
                    }
                    Toggle(isOn: $extranapkins) {
                        Text("Frequent refills")
                    }
                    
                }
            }
            
        }
        
    }
}



#Preview {
     AccountView()
}
