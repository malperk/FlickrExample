//
//  FlickrFeedJsonDecodeTests.swift
//  FlickrExampleTests
//
//  Created by Alper KARATAS on 9/27/18.
//  Copyright © 2018 Alper KARATAS. All rights reserved.
//

import XCTest

var flickrFeedData = Data()
var emptyData = Data()
class FlickrFeedJsonDecodeTests: XCTestCase {
    // Override class func to setup once
    override class func setUp() {
        super.setUp()
        // Creating semaphore to make aysn request for flickrFeedData
        let semaphore = DispatchSemaphore(value: 0)
        let flickrDataProvider = InternetDataProvider(urlString: URLs.flickrURL)
        flickrDataProvider.provideData { response in
            XCTAssertNotNil(response.data)
            flickrFeedData = response.data!
            semaphore.signal()
        }
        semaphore.wait()
    }
    func testDecodeDataToFlickrFeedObject() {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let _ = try decoder.decode(FlickrFeed.self, from: flickrFeedData)
        } catch {
            XCTAssert(false, error.localizedDescription)
        }
    }
    func testDecodeEmtyDataToFlickrFeedObject() {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let _ = try decoder.decode(FlickrFeed.self, from: emptyData)
            XCTAssert(true)
        } catch {
            XCTAssert(true, error.localizedDescription)
        }
    }

}
