//
//  GenderDetailView.swift
//  ConsolidationIV
//
//  Created by Purnaman Rai (College) on 23/09/2025.
//

import SwiftUI

struct GenderDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var gender: Gender
    
    var body: some View {
        Text(gender.name)
        
        Button {
            if gender.name == "Male" {
                gender.name = "Female"
            } else {
                gender.name = "Male"
            }
        } label: {
            if gender.name == "Male" {
                Text("Change to Female")
            } else {
                Text("Change to Male")
            }
        }
        
        Button("Go Back") {
            dismiss()
        }
    }
}

#Preview {
    GenderDetailView(gender: Gender())
}
