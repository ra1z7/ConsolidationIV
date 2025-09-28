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
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .padding(.vertical, 12)
            
            HStack {
                ForEach(0..<7) { index in
                    VStack(spacing: 10) {
                        Text("\(daysOfMonth[index])")
                            .fontWeight(.semibold)
                            .foregroundStyle((daysOfWeek[index] == "Thu" && daysOfMonth[index] == 9) ? .black : .white)
                        Text(daysOfWeek[index])
                            .font(.caption)
                            .foregroundStyle((daysOfWeek[index] == "Thu" && daysOfMonth[index] == 9) ? .black.opacity(0.5) : .white.opacity(0.5))
                    }
                    .frame(width: 40, height: 64)
                    .background((daysOfWeek[index] == "Thu" && daysOfMonth[index] == 9) ? .white : .orange)
                    .clipShape(.rect(cornerRadius: 14))
                }
            }
            .padding(8)
            .background(.orange)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 13))
        }
        .padding()
        .background(.white)
        .clipShape(.rect(cornerRadius: 24))
    }
}

#Preview {
    Schedule()
        .preferredColorScheme(.dark)
}
