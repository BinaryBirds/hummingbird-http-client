import AsyncHTTPClient
import NIO
import Logging
import Foundation
import NIOFoundationCompat

public extension HTTPClient {

    func execute(
        _ request: HTTPClientRequest,
        timeout: TimeAmount = .seconds(10),
        logger: Logger? = nil
    ) async throws -> HTTPClientResponse {
        try await execute(
            request,
            deadline: .now() + timeout,
            logger: logger
        )
    }
}

public extension HTTPClientResponse.Body {
    
    func collectStream() async throws -> ByteBuffer {
        var buffer = ByteBuffer()
        for try await var chunk in self {
            buffer.writeBuffer(&chunk)
        }
        return buffer
    }
}

public extension ByteBuffer {
    
    func getString(
        encoding: String.Encoding = .utf8
    ) -> String? {
        getString(
            at: 0,
            length: readableBytes,
            encoding: encoding
        )
    }
    
    func getData(
        byteTransferStategy: ByteTransferStrategy = .automatic
    ) -> Data? {
        getData(
            at: 0,
            length: readableBytes,
            byteTransferStrategy: byteTransferStategy
        )
    }
    
}
