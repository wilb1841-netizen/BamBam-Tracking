//
//  NewGroupView.swift
//  BamBam Tracking
//
//  Created by Wilbert Baker on 4/13/26.
//

import SwiftUI

struct NewGroupView: View {
    @Environment(\.dismiss) var dismiss
    @State private var groupName = ""
    @State private var selectedIcon = "list, bullet"
    let icons = ["list.bullet", "star.fill", "house.fill", "star"]
    var onSave: (TaskGroup) -> ()
    
    var body: some View {
        NavigationStack{
            Form{
                // Section1: Group title
                Section("Group Name"){
                    TextField("e.g. Work", text: $groupName)
                }
                // Section 2: symbol Icon
                Section("Select Icon"){
                    LazyVGrid(columns: [GridItem(.adaptive(minimum:40))]) {
                        ForEach(icons, id: \.self) { icon in
                            Image(systemName: icon)
                                .font(.title2)
                                .frame(width: 40, height: 40)
                                .background(selectedIcon == icon ? Color.blue : Color.clear)
                                .onTapGesture{
                                    selectedIcon = icon
                                }
                            
                        }
                                            }
                                            .padding(.vertical)
                                        }
                                    }
                                    .navigationTitle("New Group")
                                    .toolbar {
                                        ToolbarItem(placement: .cancellationAction) {
                                            Button("Cancel") { dismiss() }
                                        }
                                        
                                        ToolbarItem(placement: .confirmationAction) {
                                            Button("Save") {
                                                let newGroup = TaskGroup(title: groupName, symbolName: selectedIcon, tasks: [])
                                                onSave(newGroup)
                                                dismiss()
                                            }
                                            .disabled(groupName.isEmpty)
                                        }
                                    }
                                }
                            }
                        }
