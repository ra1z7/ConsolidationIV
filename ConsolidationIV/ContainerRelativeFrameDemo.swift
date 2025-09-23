//
//  ContainerRelativeFrameDemo.swift
//  ConsolidationIV
//
//  Created by Purnaman Rai (College) on 23/09/2025.
//

import SwiftUI

struct ContainerRelativeFrameDemo: View {
    @State private var frameSize = 350.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke()
                .frame(width: 175, height: 175)
            
            VStack {
                Circle()
                    .fill(.secondary)
                    .containerRelativeFrame(.horizontal) { parentWidth, _ in
                        parentWidth * 0.5
                    }
            }
            .frame(width: frameSize, height: frameSize)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke()
            }
        }
        
        Slider(value: $frameSize, in: 100...350)
            .padding(50)
    }
}

#Preview {
    ContainerRelativeFrameDemo()
}
