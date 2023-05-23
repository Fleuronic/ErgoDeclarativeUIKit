// Copyright © Fleuronic LLC. All rights reserved.

import Ergo
import XCTest
import SnapshotTesting

@testable import ErgoDeclarativeUIKit

public func assertView<View: UIView & LayoutProvider>(ofType type: View.Type, backedBy screen: View.Screen, matchesSnapshotIn filePath: String) {
	XCTAssertNil(
		verifySnapshot(
			matching: LayoutViewController<View>(
				screen: screen,
				environment: .empty
			).view,
			as: .image,
			snapshotDirectory: filePath
				.components(separatedBy: ".")
				.dropLast(1)
				.joined(separator: ".")
				.replacing("/Tests", with: "/Resources"),
			testName: "ViewLayoutSnapshot"
		)
	)
}
