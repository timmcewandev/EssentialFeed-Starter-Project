//
//  RemoteFeedLoaderTest.swift
//  EssentialFeedTests
//
//  Created by Tim McEwan on 5/28/25.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
        
    }
    func load() {
        client.get(from: url)
    }
}
protocol HTTPClient {
    func get(from url: URL)
}



final class RemoteFeedLoaderTest: XCTestCase {
    
    func test_init_DoesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_DoesRequestDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        
        XCTAssertEqual(client.requestedURL, url)
    }
    
    
    //MARK: Helpers
    //Make Factory
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
        
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        
        func get(from url: URL) {
           requestedURL = url
       }
   }
    
}
