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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", revision: "e4bf5f323ad1a868f5204b2c6f2b23df0307d483"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", revision: "8d33dc7510f9908c8b1814a960f6afdd974e9c43"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", revision: "f4a22c776ac2bbff5a5c41117572cf5cb809324e"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", revision: "f0c69c8ba0244d9f0b9fd6192dcec332d743de93"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", revision: "49701921ca397cc9612d45b4e037a2d7576b7d39"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", revision: "00ba5570aa6cf8e6a7b4973bddfbb9b46ed54921")
	],
	targets: [
		.target(name: "GXGAMUIWrapper",
				dependencies: [
					"GXGAMUI",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.tvOS, .watchOS, .iOS])),
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.tvOS, .iOS])),
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.tvOS, .iOS])),
					.product(name: "GXGAM", package: "GXGAM", condition: .when(platforms: [.tvOS, .watchOS, .iOS])),
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.tvOS, .iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXGAMUI",
			url: "https://pkgs.genexus.dev/iOS/beta/GXGAMUI-1.0.0-beta+20230610052334.xcframework.zip",
			checksum: "4b513960323f5cb5e26b24f1e00458c77baf7eb1bbfc7072aa11c920b235a7f4"
		)
	]
)