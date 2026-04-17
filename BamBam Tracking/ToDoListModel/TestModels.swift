//
//  TestModels.swift
//  BamBam Tracking
//
//  Created by Wilbert Baker on 4/11/26.
//

//Brain where all the logic will be

import Foundation

struct TaskItem: Identifiable, Hashable, Codable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct TaskGroup: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var symbolName: String
    var tasks: [TaskItem]
}

// Mock Data
extension TaskGroup {
    static let sampleData: [TaskGroup] = [
        TaskGroup(title: "Groceries", symbolName: "storefront.circle.fill", tasks: [
            TaskItem(title: "Buy Apples"),
            TaskItem(title: "Buy Milk ")
            ]),
        TaskGroup(title: "Home", symbolName: "house.fill", tasks: [
            TaskItem(title: "Walk the dog", isCompleted: true ),
            TaskItem(title: "Clean the kictchen")
            
        ])
    ]
}
