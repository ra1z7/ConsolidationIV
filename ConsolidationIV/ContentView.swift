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
    var name = ""
}

struct GenderSelectView: View {
    @State private var gender = Gender()
    
    var genderIconName: String {
        if gender.name == "Male" {
            return "figure.stand"
        } else if gender.name == "Female" {
            return "figure.stand.dress"
        } else {
            return "figure.stand.dress.line.vertical.figure"
        }
    }
    
    func genderColor(for gender: String) -> Color {
        if gender == "Male" {
            return .blue
        } else if gender == "Female" {
            return .pink
        } else {
            return .gray
        }
    }

    var body: some View {
        VStack(spacing: 30) {
            Text("Select Your Gender")
                .foregroundStyle(.secondary)
            
            VStack(spacing: 0) {
                Image(systemName: genderIconName)
                    .font(.system(size: gender.name == "" ? 80 : 90))
                    .frame(width: 150, height: 120)
                    .foregroundStyle(genderColor(for: gender.name))
                    .contentTransition(.symbolEffect(.replace))
                    .padding()
                
                Rectangle()
                    .fill(.secondary)
                    .frame(width: 180, height: 0.5)
                
                HStack {
                    ForEach(["Male", "Female"], id: \.self) { genderName in
                        Button {
                            withAnimation {
                                gender.name = genderName
                            }
                        } label: {
                            Text(gender.name == genderName ? genderName : String(genderName.first!))
                                .frame(width: gender.name == genderName ? 80 : 12)
                                .contentTransition(.numericText())
                        }
                        .buttonStyle(.bordered)
                        .tint(genderColor(for: genderName))
                    }
                }
                .padding()
            }
            .overlay {
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.secondary, lineWidth: 0.5)
            }
            
            Button("Reset") {
                gender.name = ""
            }
            .buttonStyle(.bordered)
            .tint(.gray)
        }
    }
}

#Preview {
    GenderSelectView()
}
