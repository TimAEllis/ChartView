import SwiftUI

public struct LineShape: Shape {
	public var data: ChartData
	public var closed: Bool = false
	/// A value to determine how curved the chart should be. Valid values are 0...1
	private let lineRadius: CGFloat = 0.4
	
	public func path(in rect: CGRect) -> Path {
		let xStep: DataPoint.Value = rect.width / CGFloat(max(1, data.dataPoints.count - 1))
		var path = Path()
		var previousPoint: CGPoint = .zero
		data.dataPoints.enumerated().forEach { idx, elem in
			let point = CGPoint(
				x: (DataPoint.Value(idx) * xStep),
				y: rect.height - data.getHeight(for: elem, size: rect.size)
			)
			let deltaX = point.x - previousPoint.x
			let curveXOffset = deltaX * self.lineRadius
			
			if idx == 0 {
				path.move(to: CGPoint(x: 0.0, y: point.y))
				path.addLine(to: point)
			}
			else {
				path.addCurve(
					to: point,
					control1: CGPoint(
						x: previousPoint.x + curveXOffset,
						y: previousPoint.y
					),
					control2: CGPoint(
						x: point.x - curveXOffset,
						y: point.y
					)
				)
			}
			previousPoint = point
		}
		if closed {
			path.addLine(to: CGPoint(
				x: rect.maxX,
				y: rect.maxY
			))
			path.addLine(to: CGPoint(
				x: rect.minX,
				y: rect.maxY
			))
			path.closeSubpath()
		}
		return path
	}
}
