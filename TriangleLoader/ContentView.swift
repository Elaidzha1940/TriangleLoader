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
            Color("Bg")
                .ignoresSafeArea()
            
            ZStack {
                TriangleShape()
                    .trim(from: strokeStart, to: strokeEnd)
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round, miterLimit: 8))
                    .foregroundColor(.white.opacity(0.5))
                Circle()
                    .offset(circleOffset)
                    .foregroundColor(.mint)
                    .frame(width: 18, height: 18)
            }
            .frame(width: 100, height: 100)
        }
        .onAppear {
            getStroke(state: .begin)
            setCircleOffset(state: .begin)
            animate()
            Timer.scheduledTimer(withTimeInterval: animationDuration * 4.5, repeats: true) {_ in 
                animate()
            }
        }
    }
    
    func animate() {
        Timer.scheduledTimer(withTimeInterval: animationDuration / 2, repeats: false) {_ in
            withAnimation(.easeInOut(duration: animationDuration)) {
                getStroke(state: .phaseOne)
            }
            
            withAnimation(.spring(response: animationDuration * 2, dampingFraction: 0.85)) {
                setCircleOffset(state: .phaseOne)
            }
        }
        Timer.scheduledTimer(withTimeInterval: animationDuration * 2, repeats: false) {_ in
            withAnimation(.easeInOut(duration: animationDuration)) {
                getStroke(state: .phaseTwo)
            }
            withAnimation(.spring(response: animationDuration * 2, dampingFraction: 0.85)) {
                setCircleOffset(state: .phaseTwo)
            }
        }
        Timer.scheduledTimer(withTimeInterval: animationDuration * 3.5, repeats: false) {_ in
            setCircleOffset(state: .stop)
            
            withAnimation(.easeInOut(duration: animationDuration)) {
                getStroke(state: .begin)
            }
            withAnimation(.spring(response: animationDuration)) {
                getStroke(state: .begin)
            }
            withAnimation(.spring(response: animationDuration * 2, dampingFraction: 0.85)) {
                setCircleOffset(state: .begin)
            }
        }
    }
    
    func getStroke(state: TriangleState) {
        (self.strokeStart, self.strokeEnd) = state.getStrokes()
    }
    
    func setCircleOffset(state: TriangleState) {
        let offset = state.getCircleOffset()
        self.circleOffset = CGSize(width: offset.0, height: offset.1)
    }
}

#Preview {
    ContentView()
}
