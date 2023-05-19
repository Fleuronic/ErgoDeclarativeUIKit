// Copyright © Fleuronic LLC. All rights reserved.

import protocol Ergo.ScreenBacked
import protocol Layoutless.AnyLayout

public protocol LayoutProvider: ScreenBacked {
	func layout(with screen: some ScreenProxy<Screen>) -> AnyLayout
}
