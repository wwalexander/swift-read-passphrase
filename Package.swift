// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift-read-passphrase",
    products: [
        .library(
            name: "ReadPassphrase",
            targets: ["ReadPassphrase"]),
    ],
    targets: [
        .target(name: "ReadPassphrase"),
    ]
)
