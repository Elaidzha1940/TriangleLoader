//  /*
//
//  Project: TriangleLoader
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 20.12.2023
//
//  */

import SwiftUI

enum TriangleState {
    case begin
    case phaseOne
    case phaseTwo
    case stop
    
    func getStrokes() -> (CGFloat, CGFloat) {
        switch self {
        case .begin:
            return(0.335, 0.665)
        case .phaseOne:
            return(0.5, 0.825)
        case .phaseTwo:
            return(0.675, 1)
        case .stop:
            return(0.175, 0.5)
        }
    }
    
    func getCircleOffset() -> (CGFloat, CGFloat) {
        switch self {
        case .begin:
            return(0, 30)
        case .phaseOne:
            return(30, -5)
        case .phaseTwo:
            return(-30, -5)
        case .stop:
            return(-30, 0)
        }
    }
}

struct ContentView: View {
    @State var strokeStart: CGFloat = 0
    @State var strokeEnd: CGFloat = 0
    @State var circleOffset: CGSize = CGSize(width: 0, height: 0)
    
    let animationDuration: TimeInterval = 0.7
    var circleColor: Color = Color.mint
    
    var body: some View {
        
        ZStack {
           
        }
    }
}

#Preview {
    ContentView()
}
