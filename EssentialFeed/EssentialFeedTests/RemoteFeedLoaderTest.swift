//
//  RemoteFeedLoaderTest.swift
//  EssentialFeedTests
//
//  Created by Tim McEwan on 5/28/25.
//

import XCTest

class RemoteFeedLoader {}
class HTTPClient {
    var requestedURL: URL?
}

final class RemoteFeedLoaderTest: XCTestCase {
    
    func test_init_DoesNotRequestDataFromURL() {
        let client = HTTPClient()
        let _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }
    
}
