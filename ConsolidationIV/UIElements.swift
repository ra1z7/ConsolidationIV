//
//  UIElements.swift
//  ConsolidationIV
//
//  Created by Purnaman Rai (College) on 25/09/2025.
//

import SwiftUI

struct UIElements: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            SearchBar()
        }
    }
}

struct SearchBar: View {
    var body: some View {
        HStack {
            Text("Search")
                .foregroundStyle(.secondary)
            Spacer()
            Image(systemName: "magnifyingglass")
        }
        .padding()
        .frame(width: 300, height: 50)
        .font(.subheadline)
        .foregroundStyle(.black)
        .background(.white)
        .clipShape(.rect(cornerRadius: 60))
    }
}

struct Schedule: View {
    let daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    let daysOfMonth = [6, 7, 8, 9, 10, 11, 12]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Schedule")
            
            HStack {
                ForEach(0..<7) { index in
                    VStack {
                        Text("\(daysOfMonth[index])")
                        Text(daysOfWeek[index])
                    }
                }
            }
        }
    }
}

#Preview {
    Schedule()
}
