// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXGAMUI",
	platforms: [.iOS("15.0"), .watchOS("10.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXGAMUI",
			targets: ["GXGAMUIWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.2.0-beta.21"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", exact: "3.2.0-beta.21")
	],
	targets: [
		.target(name: "GXGAMUIWrapper",
				dependencies: [
					"GXGAMUI",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS])),
					.product(name: "GXGAM", package: "GXGAM", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXGAMUI",
			url: "https://pkgs.genexus.dev/iOS/beta/GXGAMUI-3.2.0-beta.21.xcframework.zip",
			checksum: "4f59e95122ac8f703f4fbf9a02b334ebf7f493bbf09ca98e920e18182d355012"
		)
	]
)