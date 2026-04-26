//
//  GroupStateView.swift
//  BamBam Tracking
//
//  Created by Wilbert Baker on 4/15/26.
//

import SwiftUI

struct GroupStateView : View {
    var task: [TaskItem]
    var completedCount: Int { task.filter{$0.isCompleted}.count} // completed tasks
    var progress: Double {task.isEmpty ? 0 : Double( completedCount) / Double(task.count)}
    
    var body: some View {
        
        
        
        HStack{
            ZStack{
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.3)
                    .foregroundColor(.cyan)
                    .rotationEffect(.degrees(-90))
                Text("\(Int(progress * 100 ))%")
                    .font(.caption)
                    .bold()
            }
            .frame (width: 60, height: 60)
            .padding()
            
            VStack(alignment: .leading){
                Text("Task Progress")
                Text("\(completedCount) / \(task.count)")
            }
            Spacer()
            
            
        }
    }
}
