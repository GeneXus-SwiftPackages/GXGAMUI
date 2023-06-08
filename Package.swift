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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", 108a71075c951998bdaa4037da97c513d0de271c),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", d60601ead23ef16bd8e55ba8bcf14734fe357b5e),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", c7f5e1d8ea6bd7e5a780f307eae7a43e471cbfd0),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", 74dde0711a4fa381198959e514e0bb2c76016d09),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", 50cad0ba4766a89eab4559e98397580c88f3ec05),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", a1e27a7a0817831e5e96518e9434564ef4a7bc97)
	],
	targets: [
		.target(name: "GXGAMUIWrapper",
				dependencies: [
					"GXGAMUI",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS, .watchOS])),
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.iOS, .tvOS])),
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.iOS, .tvOS])),
					.product(name: "GXGAM", package: "GXGAM", condition: .when(platforms: [.iOS, .tvOS, .watchOS])),
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXGAMUI",
			url: "https://pkgs.genexus.dev/iOS/beta/GXGAMUI-1.0.0-beta+20230608211628.xcframework.zip",
			checksum: "3fa392c92accf642dbd9343bb5dde1a17db4418af1c6666eb34c1d5619701115"
		)
	]
)