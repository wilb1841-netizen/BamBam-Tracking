//
//  ContentView.swift
//  BamBam Tracking
//
//  Created by Wilbert Baker on 4/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var taskGroups = TaskGroup.sampleData //pre-existing data from TaskModel file
    @State private var selectedGroup: TaskGroup?
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    @State private var isShowingAddGroup = false
    
    
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
                            TaskGroupDetailView(group: $taskGroups[index])
                        }
                        }
                        else {
                            ContentUnavailableView("Select a Group", systemImage: "sidebar.left")
                        }
                    }
                        .sheet(isPresented: $isShowingAddGroup) {
                            NewGroupView { NewGroup in
                                taskGroups.append(NewGroup)
                                selectedGroup = NewGroup
                            }
                        }
                }
            }
            
        
            
