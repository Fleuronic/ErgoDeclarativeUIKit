// Copyright © Fleuronic LLC. All rights reserved.

import ReactiveSwift

import protocol Ergo.ScreenBacked

@dynamicMemberLookup public protocol ScreenProxy<Screen>: ScreenBacked {
	subscript<T>(dynamicMember keyPath: KeyPath<Screen, T>) -> Property<T> { get }
	subscript<T>(dynamicMember keyPath: KeyPath<Screen, T>) -> Property<T?> { get }
	subscript(dynamicMember keyPath: KeyPath<Screen, () -> Void>) -> BindingTarget<Void> { get }
	subscript<T>(dynamicMember keyPath: KeyPath<Screen, (T) -> Void>) -> BindingTarget<T> { get }
}
