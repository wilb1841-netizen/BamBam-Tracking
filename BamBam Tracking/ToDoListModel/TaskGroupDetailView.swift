//
//  TaskGroupDetailView.swift
//  BamBam Tracking
//
//  Created by Wilbert Baker on 4/11/26.
//

// Mark: View to show the tasks

import SwiftUI

struct TaskGroupDetailView: View {
    
    @Binding var groups: TaskGroup
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        List {
            Section{
                if sizeClass == .regular {
                    GroupStateView(task: groups.tasks)
                        .listRowInsets(EdgeInsets())
                      
                }
            }
            ForEach($groups.tasks) { $task in
                HStack {
                    Image(systemName: task.isCompleted ?  "checkmark.circle.fill" : "circle")
                        .foregroundStyle(task.isCompleted ? .blue : .gray)
                        .onTapGesture {
                            withAnimation{
                                task.isCompleted.toggle()
                            }
                        }
                        .accessibilityIdentifier("TaskToggle_\(task.id)")
                    
                    TextField("Task Title", text: $task.title)
                        .strikethrough(task.isCompleted)
                        .accessibilityIdentifier("TaskTextField_\(task.id)")
                }
          }
            .onDelete { index in
                groups.tasks.remove(atOffsets: index)
            }
        }
        .navigationTitle(groups.title)
        .toolbar {
            Button("Add Task") {
                withAnimation {
                    groups.tasks.append(TaskItem(title: ""))
                }
            }
            .accessibilityIdentifier("AddTaskButton")
        }
    }
}
