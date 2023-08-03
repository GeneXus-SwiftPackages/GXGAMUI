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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.1.0-beta.7"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.1.0-beta.7"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.1.0-beta.7"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "1.1.0-beta.7"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", exact: "1.1.0-beta.7"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.1.0-beta.7")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXGAMUI-1.1.0-beta.7.xcframework.zip",
			checksum: "bcdd2785d95c6b5a0f6c74fd3e04eba5df94f302042e570273f158578ed665e5"
		)
	]
)