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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.0.0-beta.20230711141624"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230711141624"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.0.0-beta.20230711141624"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "1.0.0-beta.20230711141624"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", exact: "1.0.0-beta.20230711141624"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.0.0-beta.20230711141624")
	],
	targets: [
		.target(name: "GXGAMUIWrapper",
				dependencies: [
					"GXGAMUI",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.tvOS, .iOS, .watchOS])),
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.tvOS, .iOS])),
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.tvOS, .iOS])),
					.product(name: "GXGAM", package: "GXGAM", condition: .when(platforms: [.tvOS, .iOS, .watchOS])),
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.tvOS, .iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXGAMUI",
			url: "https://pkgs.genexus.dev/iOS/beta/GXGAMUI-1.0.0-beta.20230711141624.xcframework.zip",
			checksum: "4a9d6db9087cc6771de5e62ae19d1c8e07ace0154a577df4d0ab9a98e0c5fc20"
		)
	]
)