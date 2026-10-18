// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SajhaRoutes",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "SajhaRoutes", targets: ["SajhaRoutes"])
    ],
    targets: [
        .target(name: "SajhaRoutes"),
        .testTarget(name: "SajhaRoutesTests", dependencies: ["SajhaRoutes"])
    ]
)
