//
//  ScrollViewDemo.swift
//  ConsolidationIV
//
//  Created by Purnaman Rai (College) on 24/09/2025.
//

import SwiftUI

struct NumberBox: View {
    let number: Int
    
    var randomColor: Color {
        Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(randomColor)
                .frame(width: 50, height: 50)
            
            Text("\(number)")
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .shadow(radius: 5)
        }
    }
    
    init(for number: Int) {
        self.number = number
    }
}

struct IdentifiableNumber: Identifiable {
    let id = UUID()
    let number: Int
}

struct ScrollViewDemo: View {
    @State private var randomNumbers = [IdentifiableNumber]()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 25) {
                    ForEach(randomNumbers) { number in
                        NumberBox(for: number.number)
                            .transition(.scale)
                    }
                }
                .padding()
            }
            .navigationTitle("Numbers")
            .toolbar {
                Button("Add", systemImage: "plus ") {
                    withAnimation {
                        randomNumbers.append(IdentifiableNumber(number: Int.random(in: 0...9)))
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewDemo()
        .preferredColorScheme(.dark)
}
