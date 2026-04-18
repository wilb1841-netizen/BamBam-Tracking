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
    @Environment(\.scenePhase) private var scenePhase
    let saveKey = "taskGroupData"
    
    
    var body: some View {
        //Column 1: Left
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List (selection: $selectedGroup) {
                ForEach(taskGroups) {group in // loops through the elements
                    NavigationLink(value: group) { //go to the selected group
                        Label(group.title, systemImage: group.symbolName)  // show title & symbol
                    }
                }
            }
            
            
            navigationTitle("ToDo APP")
                .listStyle(.sidebar)
                .toolbar {
                    Button{
                        isShowingAddGroup = true
                    }label: {
                        Image(systemName: "plus")
                    }
                    
                }}
        detail  : {
            if let group = selectedGroup {
                if let index = taskGroups.firstIndex(where: {$0.id == group.id}) {
                    TaskGroupDetailView(groups: $taskGroups[index])
                }
            }
            else {
                ContentUnavailableView("Select a Group", systemImage: "sidebar.left")
            }
        }
        .sheet(isPresented: $isShowingAddGroup) {
            NewGroupView { NewGroup in
                taskGroups.append(NewGroup)
                selectedGroup = NewGroup // automatically show up the details of the new group I created
                
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
        if let encodeedData = try? JSONEncoder().encode(taskGroups) {
            // save it in userDefaults
            UserDefaults.standard.set(encodeedData, forKey:saveKey)
        }
        
    }
    func loadData() {
        if let saveData = UserDefaults.standard.data(forKey: saveKey) {
        if let decodedGroups = try? JSONDecoder().decode([TaskGroup].self, from: saveData) {
                taskGroups = decodedGroups
                return
            }
        }
        taskGroups = TaskGroup.sampleData //if no datas was found to load
    }
    
    
}
