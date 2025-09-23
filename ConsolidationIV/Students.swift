//
//  Students.swift
//  ConsolidationIV
//
//  Created by Purnaman Rai (College) on 23/09/2025.
//

import SwiftUI

struct Student: Codable, Identifiable {
    var id: Int
    let name: String
    let section: String
    let level: Int
    let course: String
}

@Observable
class Students {
    var list: [Student] {
        didSet {
            if let encoded = try? JSONEncoder().encode(list) {
                UserDefaults.standard.set(encoded, forKey: "StudentList")
            }
        }
    }
    
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "StudentList") {
            if let decoded = try? JSONDecoder().decode([Student].self, from: savedData) {
                list = decoded
                return
            }
        }
        
        list = []
    }
}

struct StudentListView: View {
    @State private var students = Students()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(students.list) { student in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(student.name)
                                .font(.headline)
                            Text(student.course)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("Level: \(student.level)")
                            Text("Section: \(student.section)")
                        }
                        .font(.subheadline)
                    }
                }
                .onDelete { offsets in
                    students.list.remove(atOffsets: offsets)
                }
            }
            .toolbar {
                EditButton()
                
                Button("Add Students") {
                    let studentsAsJSON = """
                    [
                        {
                            "id": 1,
                            "name": "John Doe",
                            "section": "C",
                            "level": 4,
                            "course": "Computer Science"
                        },
                        {
                            "id": 2,
                            "name": "John Doe",
                            "section": "C",
                            "level": 4,
                            "course": "Computer Science"
                        }
                    ]
                    """
                    
                    if let studentsAsData = studentsAsJSON.data(using: .utf8) {
                        if let decodedStudents = try? JSONDecoder().decode([Student].self, from: studentsAsData) {
                            students.list.append(contentsOf: decodedStudents)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    StudentListView()
}
