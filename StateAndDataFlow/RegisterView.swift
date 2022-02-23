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
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
            Button(action: registerUser) {
                if name >= String(3) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("Ok")
                    }
                } else {
                    HStack {
                        Image(systemName: "checkmark.circle")
                            .disabled(true)
                        Text("Ok")
                            .disabled(true)
                    }
                }
            }
        }
    }
}

extension RegisterView {
    private func registerUser() {
        if !name.isEmpty && name >= String(3) {
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
