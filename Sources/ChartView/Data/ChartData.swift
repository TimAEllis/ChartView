import SwiftUI

public struct ChartData {
	public let dataPoints: [DataPoint]
	public let minDataPoint: DataPoint.Value?
	public let maxDataPoint: DataPoint.Value?
	public let paddingInsets: EdgeInsets
	
	public func containerSize(size: CGSize) -> CGSize {
		return CGSize(
			width: size.width, // - (paddingInsets.leading + paddingInsets.trailing),
			height: size.height - (paddingInsets.top + paddingInsets.bottom)
		)
	}
	
	public func getHeight(for dataPoint: DataPoint, size: CGSize) -> DataPoint.Value {
		let containerHeight = containerSize(size: size).height
		return DataPoint.Value((Double(dataPoint.value) / Double(maxDataPoint ?? dataPoint.value) * Double(containerHeight)))
	}
	
}
