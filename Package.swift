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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.0.0-rc.15"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", exact: "3.0.0-rc.15")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXGAMUI-3.0.0-rc.15.xcframework.zip",
			checksum: "b970a38e94ce0d3fc81b810c72431af22d3770cb4655ece01d7a7805693a00a6"
		)
	]
)