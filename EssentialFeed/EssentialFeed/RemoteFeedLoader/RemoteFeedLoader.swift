//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Tim McEwan on 7/29/25.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL)
}


public final class RemoteFeedLoader {
    private let client: HTTPClient
    private let url: URL
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
        
    }
    public func load() {
        client.get(from: url)
        client.get(from: url)
    }
}
