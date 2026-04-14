//
//  TestModels.swift
//  BamBam Tracking
//
//  Created by Wilbert Baker on 4/11/26.
//

//Brain where all the logic will be

import Foundation

struct TaskItem: Identifiable, Hashable {
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

// pre-existing data
extension TaskGroup {
    static let sampleData: [TaskGroup] = [
        TaskGroup(title: "School", symbolName: "book.fill", tasks: [
            TaskItem(title: "Do homework"),
            TaskItem(title: "Submit assignment", isCompleted: true)
            ]),
        TaskGroup(title: "Home", symbolName: "house.fill", tasks: [
            TaskItem(title: "Walk the dog", isCompleted: true ),
            TaskItem(title: "Clean the kictchen")
            
        ])
    ]
}
