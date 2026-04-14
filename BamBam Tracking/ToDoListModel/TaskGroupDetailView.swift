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
    
    var body: some View {
        
        List {
            ForEach($groups.tasks) { $task in
                HStack {
                    Image(systemName: task.isCompleteed ?  "checkmark.circle.fill" : "circle")
                        .foregroundStyle(task.isCompleted ? .blue : .gray)
                        .onTapGesture {
                            withAnimation{
                                task.isCompleted.toggle()
                            }
                        }
                    TextField("Task Title", text: $task.title)
                        .strikethroug(task.iscompleted)
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
        }
    }
}
