//
//  ProfileView.swift
//  Note
//
//  Created by Babypowder on 2/4/2567 BE.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        VStack {
            if let user = viewModel.user {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                    .frame(width: 125, height: 125)
                    .padding(50)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name: ")
                        Text(user.name)
                    }
                    HStack {
                        Text("Email: ")
                        Text(user.email)
                    }
                    HStack {
                        Text("Member Since: ")
                        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    }
                }
                Spacer()
                
                TLButton(title: "Logout", background: .red) {
                    viewModel.logOut()
                }
                .frame(height: 50)
                
            } else {
                Text("Loading Profile...")
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
