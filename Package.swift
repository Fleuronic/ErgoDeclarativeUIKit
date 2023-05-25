// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "ErgoDeclarativeUIKit",
    platforms: [
        .iOS(.v16)
    ],
    products: [
		.library(
			name: "ErgoDeclarativeUIKit",
			targets: ["ErgoDeclarativeUIKit"]
		),
		.library(
			name: "ErgoDeclarativeUIKitTesting",
			targets: ["ErgoDeclarativeUIKitTesting"]
		)
    ],
    dependencies: [
		.package(url: "https://github.com/Fleuronic/Ergo", branch: "main"),
        .package(url: "https://github.com/Fleuronic/ErgoUIKit", branch: "main"),
		.package(url: "https://github.com/Fleuronic/Inject", branch: "main"),
		.package(url: "https://github.com/Fleuronic/Geometric", branch: "main"),
		.package(url: "https://github.com/Fleuronic/Telemetric", branch: "main"),
		.package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.10.0")
	],
    targets: [
		.target(
			name: "ErgoDeclarativeUIKit",
			dependencies: [
				"Ergo",
				"Inject",
				"Geometric",
				"Telemetric"
			]
		),
		.target(
			name: "ErgoDeclarativeUIKitTesting",
			dependencies: [
				"ErgoDeclarativeUIKit",
                .product(name: "ErgoUIKitTesting", package: "ErgoUIKit"),
				.product(name: "SnapshotTesting", package: "swift-snapshot-testing")
			]
		)
    ]
)
