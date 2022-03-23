import SwiftUI

public struct ChartLayout {
	public typealias StringTransformer = (String) -> String
	
	public let dataColor: Color
	public let showMostRecentValue: Bool
	public let showTitle: Bool
	public let dateFormatter: DateFormatter
	public let numberFormatter: NumberFormatter
	public let dateRangeFont: Font
	public let overlayTopPadding: CGFloat
	public let titleStringTransformer: StringTransformer
	
	public init(
		dataColor: Color = .blue,
		showMostRecentValue: Bool = false,
		showTitle: Bool = false,
		dateFormatter: DateFormatter,
		numberFormatter: NumberFormatter,
		dateRangeFont: Font? = nil,
		overlayTopPadding: CGFloat = 10,
		titleStringTransformer: StringTransformer? = nil
	) {
		self.dataColor = dataColor
		self.showMostRecentValue = showMostRecentValue
		self.showTitle = showTitle
		self.dateFormatter = dateFormatter
		self.numberFormatter = numberFormatter
		self.dateRangeFont = dateRangeFont ?? .subheadline
		self.overlayTopPadding = overlayTopPadding
		self.titleStringTransformer = titleStringTransformer ?? { $0 }
	}
}
