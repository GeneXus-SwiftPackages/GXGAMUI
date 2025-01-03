// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXGAMUI",
	platforms: [.iOS("13.0"), .watchOS("9.0"), .tvOS("13.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXGAMUI",
			targets: ["GXGAMUIWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.2.0-beta.30"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", exact: "2.2.0-beta.30")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXGAMUI-2.2.0-beta.30.xcframework.zip",
			checksum: "7fa758da99e1e93650ecc9b637bcdaaadf801938066c66ed7daec5dc35588960"
		)
	]
)