//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $user.name)
                    .multilineTextAlignment(.center)
                Text("\(user.name.count)")
                    .foregroundColor(user.nameIsValid ? .red : .green)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(user.nameIsValid)
        }
        .padding()
    }
}

extension RegisterView {
    private func registerUser() {
        if !user.name.isEmpty {
            user.name = name
            user.isRegister.toggle()
        }
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
