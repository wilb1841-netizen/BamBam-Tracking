//
//  TestModels.swift
//  BamBam Tracking
//
//  Created by Wilbert Baker on 4/11/26.
//
//Brain where all the logic will be

import Foundation

struct TaskItem: Identifiable, Hashable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct TaskGroup: Identifiable, Hashable, Codable {
    var id = UUID()
    var title: String
    var symbolName: String
    var tasks: [TaskItem]
}
// ADD NEW MODEL PROFILE (name, profleimage, groups)
struct Profile: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var profileImage: String
    var groups: [TaskGroup]
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


extension Profile {
    static let sampleProfile: [Profile] = [
        Profile(name: "Professor", profileImage: "professor", groups: TaskGroup.sampleData),
        Profile(name: "Student", profileImage:"student", groups:[])
    ]
}
