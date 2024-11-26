// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXGAMUI",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXGAMUI",
			targets: ["GXGAMUIWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.2.0-beta.15"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", exact: "2.2.0-beta.15")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXGAMUI-2.2.0-beta.15.xcframework.zip",
			checksum: "9cb154a5c84baeed46bb2070f7f059a84990f7187531220f55f533ca5a7d0be1"
		)
	]
)