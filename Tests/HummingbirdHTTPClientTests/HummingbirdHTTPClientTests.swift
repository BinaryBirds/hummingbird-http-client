import Hummingbird
import HummingbirdHTTPClient
import Logging
import NIO
import XCTest

final class HummingbirdClientTests: XCTestCase {
    
    func testSimpleText() async throws {
        let app = HBApplication()
        app.services.httpClient = .init(
            eventLoopGroupProvider: .shared(app.eventLoopGroup)
        )
        
        let res = try await app.httpClient.execute(
            .init(url: "https://jsonserver.binarybirds.com/api/v1/posts/")
        )

        let buffer = try await res.body.collectStream()
        let data = buffer.getData()

        XCTAssertNotNil(data)
        
        try app.shutdownApplication()
    }
}
