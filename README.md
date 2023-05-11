# Hummingbird HTTP Client

A simple service extension using AsyncHTTPClient as a HTTP client for Hummingbird.

## Getting started 

Adding the dependency

Add the following entry in your `Package.swift` to start using `HummingbirdHTTPClient`:

```swift
.package(url: "https://github.com/feathercms/hummingbird-http-client", from: "1.0.0"),
```

and `HummingbirdHTTPClient` dependency to your target:

```swift
.product(name: "HummingbirdHTTPClient", package: "hummingbird-http-client"),
```


## Example

Simple usage

```swift
import Hummingbird
import HummingbirdHTTPClient

let app = HBApplication()
app.services.httpClient = .init(
    eventLoopGroupProvider: .shared(app.eventLoopGroup)
)

let res = try await app.httpClient.execute(
    .init(url: "https://jsonserver.binarybirds.com/api/v1/posts/")
)

// process response

try app.shutdownApplication()
```
