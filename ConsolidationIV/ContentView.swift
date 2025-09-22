//
//  ContentView.swift
//  ConsolidationIV
//
//  Created by Purnaman Rai (College) on 22/09/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

// Why @State works with structs
struct Gender {
    var gender: String
    
    init(gender: String = "Male") {
        self.gender = gender
    }
}

struct GenderSelectView: View {
    @State private var gender = Gender()
    
    var genderIcon: String {
        if gender.gender == "Male" {
            return "figure.stand"
        } else {
            return "figure.stand.dress"
        }
    }
    
    var genderIconColor: Color {
        if gender.gender == "Male" {
            return .blue
        } else {
            return .pink
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: genderIcon)
                .font(.system(size: 100))
                .foregroundStyle(genderIconColor)
                .contentTransition(.symbolEffect(.replace))
                .padding(.top)
            
            Rectangle()
                .fill(.secondary)
                .frame(width: 175, height: 0.5)

            HStack {
                makeButton(for: "Male", ofColor: .blue)
                makeButton(for: "Female", ofColor: .pink)
            }
            .padding()
        }
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .stroke(.secondary, lineWidth: 0.5)
        }
    }
    
    func makeButton(for genderName: String, ofColor color: Color) -> some View {
        Button {
            gender.gender = genderName
        } label: {
            Text(genderName)
                .frame(width: 60)
        }
        .buttonStyle(.bordered)
        .tint(color)
    }
}

#Preview {
    GenderSelectView()
}
