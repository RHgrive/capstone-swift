// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Capstone",
    dependencies: [
        .package(name: "Capstone", url: "https://github.com/zydeco/capstone-swift", .branch("v4")),
    ],
    targets: [
        name: "Capstone",
        .target(name: "<command-line-tool>", dependencies: [
            "Capstone",
        ]),
    ]
)
