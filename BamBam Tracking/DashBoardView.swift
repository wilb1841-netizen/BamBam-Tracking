//
//  DashBoardView.swift
//  BamBam Tracking
//
//  Created by Wilbert Baker on 4/22/26.
//

import SwiftUI

struct DashBoardView: View {
    
    
    @State private var profiles: [Profile] = Profile.sampleProfile
    @State private var path = NavigationPath()
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible (), spacing: 20)
    ]
    var body: some View {
        NavigationStack(path: $path){
            ZStack {
                ScrollView {
                    VStack(spacing: 40) {
                        Text("Welcome Back")
                            .font(.largeTitle)
                            .textCase(.uppercase)
                        Text("Who is logging in today?")
                            .font(.caption)
                    }
                    LazyVGrid(columns: columns, spacing:20){
                        ForEach(profiles) { profile in
                            NavigationLink(value: profile){
                                VStack {
                                    ZStack {
                                        Image(profile.profileimage)
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(RoundedRectangle(cornerRadius: 22))
                                        Text(profile.name)
                                            .font(.system(.headline, design: .rounded))
                                            .fontWeight(.bold)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            
            
            .navigationTitle("Profile Menu")
            .navigationDestination(for:Profile.self) { selectedProfile in
                if let index = profiles.firstIndex(where: {$0.id == selectedProfile.id}) {
                    ContentView(profiles:$profiles[index])
                    
                }
            }
        }
    }
}
