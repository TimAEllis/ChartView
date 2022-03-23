import SwiftUI

public struct LineChartView: View {
	public let data: ChartData
	public var dataColor: Color
	public var lineWidth: CGFloat = 2.0
	
	public var body: some View {
		ZStack {
			backgroundView
				.clipShape(
					LineShape(
						data: data,
						closed: true
					)
				)
			LineShape(data: data)
				.stroke(dataColor, lineWidth: lineWidth)
		}
	}
}

private extension LineChartView {
	var backgroundView: some View {
		LinearGradient(
			colors: [
				dataColor.opacity(0.9),
				Color.background.opacity(0.0),
			],
			startPoint: .top,
			endPoint: .bottom
		)
	}
}
