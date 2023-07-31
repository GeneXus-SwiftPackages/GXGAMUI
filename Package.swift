// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXGAMUI",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXGAMUI",
			targets: ["GXGAMUIWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.1.0-beta.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.1.0-beta.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.1.0-beta.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "1.1.0-beta.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", exact: "1.1.0-beta.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.1.0-beta.6")
	],
	targets: [
		.target(name: "GXGAMUIWrapper",
				dependencies: [
					"GXGAMUI",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.watchOS, .tvOS, .iOS])),
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.tvOS, .iOS])),
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.tvOS, .iOS])),
					.product(name: "GXGAM", package: "GXGAM", condition: .when(platforms: [.watchOS, .tvOS, .iOS])),
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.tvOS, .iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXGAMUI",
			url: "https://pkgs.genexus.dev/iOS/beta/GXGAMUI-1.1.0-beta.6.xcframework.zip",
			checksum: "3cb098c6066e0017d98caf21986537d84e1f45d7f06a9a31fa07a184e8956db1"
		)
	]
)