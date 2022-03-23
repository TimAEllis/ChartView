import SwiftUI

extension Color {
	static var background: Color {
		#if canImport(UIKit)
		Color(UIColor.systemBackground)
		#elseif os(OSX)
		Color(NSColor.windowBackgroundColor)
		#endif
	}
}
