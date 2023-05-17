// Copyright © Fleuronic LLC. All rights reserved.

import UIKit
import Layoutless
import WorkflowUI

public protocol ReactiveView: UIView {
	associatedtype Screen: WorkflowUI.Screen

	func layout(with screen: some ScreenProxy<Screen>) -> AnyLayout
}
