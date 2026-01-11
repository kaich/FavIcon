// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FavIcon",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13),
        .tvOS(.v12),
        .watchOS(.v4)
    ],
    products: [
        .library(
            name: "FavIcon",
            targets: ["FavIcon"]
        ),
    ],
    dependencies: [
        // No external dependencies
    ],
    targets: [
        .systemLibrary(
            name: "libxmlFavicon",
            path: "Sources/Modules",
            pkgConfig: "libxml-2.0"
        ),
        .target(
            name: "FavIcon",
            dependencies: ["libxmlFavicon"],
            path: "Sources/FavIcon",
            cSettings: [
                .define("SWIFT_PACKAGE")
            ]
        ),
        .testTarget(
            name: "FavIconTests",
            dependencies: ["FavIcon"],
            path: "Tests/FavIconTests"
        ),
    ]
)