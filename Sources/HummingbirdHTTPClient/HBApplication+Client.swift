import Hummingbird
import HummingbirdServices
import AsyncHTTPClient

extension HBApplication.Services {

    public var httpClient: HTTPClient {
        get {
            get(\.services.httpClient, "HTTP client service is not configured")
        }
        nonmutating set {
            set(\.services.httpClient, newValue) {
                try? $0.syncShutdown()
            }
        }
    }
}

extension HBApplication {

    public var httpClient: HTTPClient {
        services.httpClient
    }
}

extension HBRequest {

    public var httpClient: HTTPClient {
        application.services.httpClient
    }
}
