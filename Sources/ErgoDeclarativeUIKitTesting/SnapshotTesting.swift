// Copyright © Fleuronic LLC. All rights reserved.

import Ergo
import XCTest
import SnapshotTesting

@testable import ErgoDeclarativeUIKit

public func assertView<View: UIView & LayoutProvider>(ofType type: View.Type, named name: String, backedBy screen: View.Screen, matchesSnapshotIn filePath: String) {
	XCTAssertNil(
		verifySnapshot(
			matching: LayoutViewController<View>(
				screen: screen,
				environment: .empty
			).view,
			as: .image,
			named: "Snapshot",
			snapshotDirectory: filePath
				.components(separatedBy: ".")
				.dropLast(1)
				.joined()
				.components(separatedBy: "/")
				.dropLast(1)
				.joined(separator: "/")
				.appending("/Resources"),
			testName: name
		)
	)
}
