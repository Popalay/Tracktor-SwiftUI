//
//  ChartView.swift
//  Tracktor
//
//  Created by Денис Никифоров on 16.07.2020.
//

import SwiftUI

struct ChartView: View {
    let data: [Double]
    
    let strokeColor = LinearGradient(gradient: Gradient(colors:Resources.Colors.gradient1), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        GeometryReader { geometry in
            let points = createPoints(data: data, size: geometry.size)
            let (conPoints1, conPoints2) = createConnectionPoints(points: points)
            let borderPath = createBorderPath(points: points, conPoints1: conPoints1, conPoints2: conPoints2)
            
            borderPath.stroke(strokeColor, lineWidth: 2)
            
        }
    }
}

func createPoints(data: [Double], size: CGSize) -> [CGPoint] {
    let bottomY = Double(size.height)
    let xDiff = Int(size.width) / (data.count - 1)
    
    let minData = data.min() ?? 0.0
    let optimizedData = data.map { $0 - minData }
    let maxData = optimizedData.max() ?? 0.0
    
    //let yMax = bottomY - (maxData / maxData * bottomY)
    
    return optimizedData.enumerated().map { (index, value) -> CGPoint in
        let y = bottomY - (value / maxData * bottomY)
        return CGPoint(x: xDiff * index, y: Int(y))
    }
}

func createConnectionPoints(points: [CGPoint]) -> ([CGPoint], [CGPoint]) {
    var conPoints1: [CGPoint] = []
    var conPoints2: [CGPoint] = []
    
    for (i, _) in points.enumerated().dropFirst() {
        conPoints1.append(CGPoint(x: (points[i].x + points[i - 1].x) / 2, y: points[i - 1].y))
        conPoints2.append(CGPoint(x: (points[i].x + points[i - 1].x) / 2, y: points[i].y))
    }
    return (conPoints1, conPoints2)
}

func createBorderPath(
    points: [CGPoint],
    conPoints1: [CGPoint],
    conPoints2: [CGPoint]
) -> Path {
    return Path { path in
        path.move(to: points.first!)
        
        for (i, _) in points.enumerated().dropFirst() {
            path.addCurve(
                to: points[i],
                control1: conPoints1[i - 1],
                control2: conPoints2[i - 1]
            )
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(data: [1.0, 332.0, 23.0, 23.0, 23.0]).environment(\.colorScheme, .dark)
    }
}
