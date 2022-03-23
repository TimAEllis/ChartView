import SwiftUI

public struct DataPoint: Identifiable {
	public typealias Value = Double
	
	public var id: Date { time }
	
	public var time: Date
	public var value: Value
}
