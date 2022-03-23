import SwiftUI

public struct ChartView: View {
	private let title: String
	private let data: ChartData
	private let style: ChartStyle
	private let layout: ChartLayout
	private let horizontalAxis: AxisInfo = .init(height: 20)
	
	public init(
		title: String = "",
		dataPoints: [DataPoint],
		style: ChartStyle = .line,
		layout: ChartLayout = .init(
			dateFormatter: DateFormatter(),
			numberFormatter: NumberFormatter()
		)
	) {
		self.title = title
		let dataValues = dataPoints.map(\.value)
		self.data = ChartData(
			dataPoints: dataPoints,
			minDataPoint: dataValues.min(),
			maxDataPoint: dataValues.max(),
			paddingInsets: EdgeInsets(
				top: 20,
				leading: 5,
				bottom: 0,
				trailing: 5
			)
		)
		self.style = style
		self.layout = layout
	}
	
	public var body: some View {
		VStack(alignment: .leading) {
			ZStack(alignment: .top) {
				chartBody
				overlayContentView
			}
			dateRangeView
		}
	}
}

private extension ChartView {
	var dateRangeView: some View {
		HStack(spacing: 0) {
			if let firstDate = data.dataPoints.first?.time {
				Spacer(minLength: 0)
				Text(layout.dateFormatter.string(from: firstDate))
				if let lastDate = data.dataPoints.last?.time, lastDate != firstDate {
					Spacer(minLength: 0)
					Text("–")
					Spacer(minLength: 0)
					Text(layout.dateFormatter.string(from: lastDate))
				}
				Spacer(minLength: 0)
			}
			else {
				Text("Empty data set")
			}
		}
		.font(layout.dateRangeFont)
		.padding(.horizontal, 8)
	}
	
	@ViewBuilder var chartBody: some View {
		switch style {
		case .bar:
			BarChartView(
				data: data,
				dataColor: layout.dataColor,
				horizontalAxis: horizontalAxis
			)
		case .line:
			LineChartView(
				data: data,
				dataColor: layout.dataColor
			)
		}
	}
	
	var overlayContentView: some View {
		VStack {
			if layout.showTitle {
				Text(layout.titleStringTransformer(title))
					.font(.headline)
					.foregroundColor(.secondary)
			}
			if layout.showMostRecentValue {
				lastValueView
			}
		}
		.padding(.top, layout.overlayTopPadding)
		.shadow(
			color: Color.background,
			radius: 1
		)
	}
	
	@ViewBuilder var lastValueView: some View {
		if let lastValue = data.dataPoints.last?.value,
		   let str = layout.numberFormatter.string(from: NSNumber(value: lastValue)) {
			Text("\(str)")
				.font(.largeTitle)
				.fontWeight(.medium)
				.foregroundColor(.primary)
		}
	}
}
