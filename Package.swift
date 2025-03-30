// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "capstone-swift",
    dependencies: [
        .package(name: "Capstone", url: "https://github.com/zydeco/capstone-swift", .branch("v4")),
    ],
    targets: [
        .target(
            name: "capstone-swift",
            dependencies: [
                "Capstone",
            ]
        ),
    ]
)
