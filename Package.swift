// swift-tools-version: 5.7.1

import PackageDescription

let package = Package(
        name: "MaskUtils",
        products: [
            .library(
                    name: "MaskUtils",
                    targets: ["MaskUtils"]
            ),
        ],
        dependencies: [],
        targets: [
            .target(
                    name: "MaskUtils",
                    dependencies: [],
                    path: "MaskUtils/MaskUtils",
                    sources: ["Classes"]
            ),
            .testTarget(
                    name: "MaskUtilsTests",
                    dependencies: ["MaskUtils"],
                    path: "MaskUtils",
                    sources: ["MaskUtilsTests/Classes"]
            ),
            .target(
                    name: "MaskUtils",
                    dependencies: [],
                    resources: [.process("Resources")]
            )
        ]
)