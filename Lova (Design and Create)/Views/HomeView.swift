//
//  HomeView.swift
//  Lova (Design and Create)
//
//  Created by Emmanuel Campbell on 8/11/24.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            
            
            ScrollView {
                content
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Courses")
                    .customFont(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
            
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(courses) { course in
                        VCard(course: course)
                    }
                }
                .padding(20)
                .padding(.bottom, 10)
            }
            
            VStack {
                Text("Recent")
                    .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack(spacing: 20) {
                    ForEach(courseSections) { section in
                        HCard(section: section)
                    }
                }
            }
            .padding(20)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
