// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
        name: "MaskUtils",
        platforms: [
            .iOS(.v14),
        ],
        products: [
            // Products define the executables and libraries a package produces, making them visible to other packages.
            .library(
                    name: "MaskUtils",
                    targets: ["MaskUtils"],
                    resources: [.process("Resources")]),
        ],
        dependencies: [
            // name - это название пакета(пункт 1), здесь нельзя указать кастомное название, необязательный параметр
//            .package(
//                name: "R.swift.Library",
//                     url: "https://github.com/mac-cain13/R.swift.Library",
//                .branch("master"))
            // Пример подключения локального пакета
//            .package(path: "../Core")
        ],
        targets: [
            // Targets are the basic building blocks of a package, defining a module or a test suite.
            // Targets can depend on other targets in this package and products from dependencies.
            .target(
                    name: "MaskUtils",
                    dependencies: [
                        // Здесь мы указываем зависимости которые мы хотим использовать в таргете
                        // name(пункт 3), package(пункт 1)
//                .product(name: "RswiftDynamic", package: "R.swift.Library")
                    ],
                    resources: [
                        // Все ресурсы которые мы хотим использовать нужно явно указать
                        // Путь к ним относительный от Sources/имя_пакета/то_что_мы_указали
                        // Если указываем папку, поиск идет рекурсивно
                        .process("Resources")
                    ]
            ),
            .testTarget(
                    name: "MaskUtilsTests",
                    dependencies: ["MaskUtils"]),
        ]
)
