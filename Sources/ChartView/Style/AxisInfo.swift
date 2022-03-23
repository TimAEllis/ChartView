import SwiftUI

public struct AxisInfo {
	public var width: CGFloat?
	public var height: CGFloat?
	
	public init(width: CGFloat? = nil, height: CGFloat? = nil) {
		self.width = width
		self.height = height
	}
}
