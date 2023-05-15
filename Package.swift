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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", branch: "beta"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", branch: "beta"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", branch: "beta"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", branch: "beta"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", branch: "beta"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", branch: "beta")
	],
	targets: [
		.target(name: "GXGAMUIWrapper",
				dependencies: [
					"GXGAMUI",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .watchOS, .tvOS])),
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.iOS, .tvOS])),
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.iOS, .tvOS])),
					.product(name: "GXGAM", package: "GXGAM", condition: .when(platforms: [.iOS, .watchOS, .tvOS])),
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXGAMUI",
			url: "https://pkgs.genexus.dev/iOS/beta/GXGAMUI-1.0.0-beta+20230515174624.xcframework.zip",
			checksum: "be1928dcc4d1f42f0fe7da19a340d5302d8c44e1ff754422a21ee768c1618135"
		)
	]
)