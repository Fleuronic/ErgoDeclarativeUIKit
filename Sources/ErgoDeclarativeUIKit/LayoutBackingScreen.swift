// Copyright © Fleuronic LLC. All rights reserved.

import UIKit
import WorkflowUI
import Inject

import protocol Ergo.ScreenBacked

public protocol LayoutBackingScreen: Screen where View.Screen == Self {
	associatedtype View: UIView & LayoutProvider
	associatedtype Strings = String
}

// MARK: -
public extension LayoutBackingScreen {
	typealias ScreenString = (Strings.Type) -> String

	// MARK: Screen
	func viewControllerDescription(environment: ViewEnvironment) -> ViewControllerDescription {
		.init(
			type: Inject.ViewControllerHost<LayoutViewController<View>>.self,
			build: { .init(.init(screen: self, environment: environment)) },
			update: { $0.instance.update(screen: self, environment: environment) }
		)
	}
}
