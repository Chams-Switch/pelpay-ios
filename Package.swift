// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Pelpay",
    platforms: [.macOS(.v10_15), .iOS(.v9)],
    products: [
      .library(
        name: "Pelpay",
        targets: ["Pelpay"]),
    ],
    targets: [
      .binaryTarget(
        name: "Pelpay",
        path: "./Sources/Pelpay.xcframework")
    ]
)
