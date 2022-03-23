import SwiftUI

public struct BarChartView: View {
	public let data: ChartData
	public var dataColor: Color
	public var horizontalAxis: AxisInfo
	
	public var body: some View {
		GeometryReader { proxy in
			VStack(alignment: .leading, spacing: 0) {
				Spacer(minLength: 0)
				HStack(alignment: .bottom, spacing: 4) {
					ForEach(data.dataPoints) { dPoint in
						dataPointView(dPoint, proxy: proxy)
					}
					
				}
			}
		}
	}
}

private extension BarChartView {
	func getHeight(for dataPoint: DataPoint, proxy: GeometryProxy) -> DataPoint.Value {
		var height = data.getHeight(for: dataPoint, size: proxy.size)
		if let horizontalLabelHeight = horizontalAxis.height {
			height -= horizontalLabelHeight
		}
		return DataPoint.Value(height)
	}
	
	func dataPointView(_ dataPoint: DataPoint, proxy: GeometryProxy) -> some View {
		RoundedRectangle(cornerRadius: 5)
			.fill(dataColor)
			.frame(minWidth: 5, idealWidth: 20, maxWidth: 100)
			.frame(height: getHeight(for: dataPoint, proxy: proxy))
	}
}
