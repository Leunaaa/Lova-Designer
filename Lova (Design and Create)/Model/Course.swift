//
//  Course.swift
//  Lova (Design and Create)
//
//  Created by Emmanuel Campbell on 8/11/24.
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var caption: String
    var color: Color
    var image: Image
}

var courses = [
    Course(title: "Animations in SwiftUI", subtitle: "Build and animate an iOS app from scratch", caption: "20 sections - 3 hours", color: Color(.gray), image: Image("Topic 1")),
    Course(title: "Build Quick Apps with SwiftUI", subtitle: "Apply your Swift and SwiftUI knowledge by building real, quick and various applications from scratch", caption: "47 sections - 11 hours", color: Color(.gray), image: Image("Topic 2")),
    Course(title: "Build a SwiftUI app for iOS 15", subtitle: "Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more", caption: "21 sections - 4 hours", color: Color(.gray), image: Image("Topic 1"))
]
