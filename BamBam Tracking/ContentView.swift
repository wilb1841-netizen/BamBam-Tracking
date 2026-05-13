//
//  ContentView.swift
//  BamBam Tracking
//
//  Created by Wilbert Baker on 4/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var taskGroups : [TaskGroup] = []
    @State private var selectedGroup: TaskGroup? // selected group
    @State private var columnVisibility: NavigationSplitViewVisibility = .all // navigation side panel
    @State private var isShowingAddGroup = false
    let saveKey = "savedtaskGroups"
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.dismiss)private var dismiss
    @Binding var profile: Profile
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            //SIDEBAR
            List (selection: $selectedGroup) {
                ForEach(profile.groups) {group in // loops through the elements
                    NavigationLink(value: group) { //go to the selected group
                        Label(group.title, systemImage: group.symbolName)  // show title & symbol
                    }
                }
            }
            .navigationTitle(profile.name)
            .listStyle(.sidebar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight:.bold))
                            .foregroundColor(Color(.secondaryLabel))
                    }
                    
                }
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isShowingAddGroup = true
                    }label: {
                        Image(systemName: "plus")
                    }
                    .accessibilityIdentifier("AddGroupButton")
                }
            }
        }detail  : {
            if let group = selectedGroup {
                if let index = profile.groups.firstIndex(where: {$0.id == group.id}) {
                    TaskGroupDetailView(groups: $profile.groups[index])
                }
            }
            else {
                ContentUnavailableView("Select a Group", systemImage: "sidebar.left")
            }
        }
        .sheet(isPresented: $isShowingAddGroup) {
            NewGroupView { NewGroup in
                profile.groups.append(NewGroup)
                
                
            }
        }
        .onAppear{
            loadData()
        }
        onChange(of: scenePhase) {oldValue, newValue in
            if newValue == .active {
                print("App is ACTIVE")
            }else if newValue == .inactive {
                print("App is inActive")
            }else if newValue == .background {
                print("Data is being saved")
                saveData()
            }
        }
    }
    
    // Data Persistence
    func saveData() {
        if let encodeedData = try? JSONEncoder().encode(profile.groups) {
            // save it in userDefaults
            UserDefaults.standard.set(encodeedData, forKey:saveKey)
        }
        
    }
    func loadData() {
        if let saveData = UserDefaults.standard.data(forKey: saveKey) {
           if let decodedGroups = try? JSONDecoder().decode([TaskGroup].self, from: saveData) {
               profile.groups = decodedGroups // HERE
                return
            }
        }
        // show mock data for dev purposes
        profile.groups = TaskGroup.sampleData // HERE
    }
    
    
}
