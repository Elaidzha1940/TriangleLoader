//  /*
//
//  Project: TriangleLoader
//  File: TriangleLoader.swift
//  Created by: Elaidzha Shchukin
//  Date: 20.12.2023
//
//  */

import SwiftUI

struct TriangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY * 0.85))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.85))

        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.85))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.85))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

#Preview {
    TriangleShape()
}
