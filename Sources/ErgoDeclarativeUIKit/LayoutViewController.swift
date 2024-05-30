// Copyright © Fleuronic LLC. All rights reserved.

import UIKit
import WorkflowUI
import ViewEnvironment
import ReactiveSwift
import ReactiveCocoa

import protocol Ergo.ScreenBacked

class LayoutViewController<View: UIView & LayoutProvider>: ScreenViewController<View.Screen> {
	private let context = Signal<Context, Never>.pipe()
	private let contentView: View

	// MARK: UIViewController
	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .systemBackground
		view.addSubview(contentView)

		NSLayoutConstraint.activate(
			[
				view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: contentView.topAnchor),
				view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
				view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
				view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
			]
		)
	}

	// MARK: ScreenViewController
	required init(screen: View.Screen, environment: ViewEnvironment) {
		contentView = .init()

		super.init(screen: screen, environment: environment)

		contentView.translatesAutoresizingMaskIntoConstraints = false
		contentView.layout(with: self).layout(in: contentView)
	}

	override func screenDidChange(from previousScreen: View.Screen, previousEnvironment: ViewEnvironment) {
		super.screenDidChange(from: previousScreen, previousEnvironment: previousEnvironment)
		context.input.receive((screen, environment))
	}
}

// MARK: -
extension LayoutViewController: ScreenBacked {
	// MARK: ScreenBacked
	typealias Screen = View.Screen
}

extension LayoutViewController: ScreenProxy {
	// MARK: ScreenProxy
	subscript<T>(dynamicMember keyPath: KeyPath<View.Screen, T>) -> Property<T> {
		.init(
			initial: screen[keyPath: keyPath],
			then: context.output.map { screen, _ in
				screen[keyPath: keyPath]
			}
		)
	}

	subscript<T>(dynamicMember keyPath: KeyPath<View.Screen, T>) -> Property<T?> {
		.init(
			initial: screen[keyPath: keyPath],
			then: context.output.map { screen, _ in
				screen[keyPath: keyPath]
			}
		)
	}

	subscript(dynamicMember keyPath: KeyPath<View.Screen, () -> Void>) -> BindingTarget<Void> {
		.init(
			lifetime: .of(self),
			action: screen[keyPath: keyPath]
		)
	}

	subscript<T>(dynamicMember keyPath: KeyPath<View.Screen, (T) -> Void>) -> BindingTarget<T> {
		.init(
			lifetime: .of(self),
			action: screen[keyPath: keyPath]
		)
	}
}

// MARK: -
private extension LayoutViewController {
	typealias Context = (View.Screen, ViewEnvironment)
}
