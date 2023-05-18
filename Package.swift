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
		)
    ],
    dependencies: [
		.package(url: "https://github.com/Fleuronic/Ergo", branch: "main"),
		.package(url: "https://github.com/Fleuronic/Inject", branch: "main"),
		.package(url: "https://github.com/Fleuronic/Geometric", branch: "main"),
		.package(url: "https://github.com/Fleuronic/Telemetric", branch: "main"),
        .package(url: "https://github.com/DeclarativeHub/Layoutless", .upToNextMajor(from: "0.4.0"))
    ],
    targets: [
		.target(
			name: "ErgoDeclarativeUIKit",
			dependencies: [
				"Ergo",
				"Inject",
				"Geometric",
				"Telemetric",
				"Layoutless"
			]
		)
    ]
)
