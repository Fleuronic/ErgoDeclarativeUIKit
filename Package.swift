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
		.package(url: "https://github.com/Fleuronic/ErgoUIKit", branch: "main"),
        .package(url: "https://github.com/DeclarativeHub/Layoutless", .upToNextMajor(from: "0.4.0"))
    ],
    targets: [
		.target(
			name: "ErgoDeclarativeUIKit",
			dependencies: [
				"ErgoUIKit",
				"Layoutless"
			]
		)
    ]
)
