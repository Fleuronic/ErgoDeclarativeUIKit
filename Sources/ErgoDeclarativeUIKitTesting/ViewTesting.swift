// Copyright © Fleuronic LLC. All rights reserved.

import UIKit

@testable import ReactiveCocoa

public extension UIControl {
	func invokeAction() {
		(allTargets.first as! CocoaTarget<Self>).invoke(self)
	}
}
