// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "hummingbird-http-client",
    platforms: [
       .macOS(.v12),
    ],
    products: [
        .library(name: "HummingbirdHTTPClient", targets: ["HummingbirdHTTPClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hummingbird-project/hummingbird", from: "1.5.0"),
        .package(url: "https://github.com/feathercms/hummingbird-services", branch: "main"),
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.9.0")
    ],
    targets: [
        .target(name: "HummingbirdHTTPClient", dependencies: [
            .product(name: "Hummingbird", package: "hummingbird"),
            .product(name: "HummingbirdServices", package: "hummingbird-services"),
            .product(name: "AsyncHTTPClient", package: "async-http-client"),
        ]),
        .testTarget(name: "HummingbirdHTTPClientTests", dependencies: [
            .target(name: "HummingbirdHTTPClient"),
        ]),
    ]
)
