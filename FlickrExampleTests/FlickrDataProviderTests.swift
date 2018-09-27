//
//  FlickrDataProviderTests.swift
//  FlickrExampleTests
//
//  Created by Alper KARATAS on 9/26/18.
//  Copyright © 2018 Alper KARATAS. All rights reserved.
//

import XCTest

class FlickrDataProviderTests: XCTestCase {
    func testSuccessfulRequest() {
        let expectation = self.expectation(description: "testSuccessfulRequest")
        let flickrDataProvider = InternetDataProvider(urlString: "https://api.flickr.com/services/feeds/photos_public.gne")
        flickrDataProvider.provideData { response in
            XCTAssertNotNil(response.data)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    func testBadRequest() {
        let expectation = self.expectation(description: "testSuccessfulRequest")
        let flickrDataProvider = InternetDataProvider(urlString: "httpsBADREQUEST://api.flickr.com")
        flickrDataProvider.provideData { response in
            XCTAssertNotNil(response.error)
            guard let _ = response.error as? InternetDataProviderError else {
                expectation.fulfill()
                return
            }
            XCTAssert(false)
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    func testGoodRequestCode() {
        let expectation = self.expectation(description: "testSuccessfulRequest")
        let flickrDataProvider = InternetDataProvider(urlString: "https://api.flickr.com/services/feeds/photos_public.gne")
        flickrDataProvider.provideData { response in
            XCTAssertNil(response.error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    func testBadRequestCode() {
        let expectation = self.expectation(description: "testSuccessfulRequest")
        let flickrDataProvider = InternetDataProvider(urlString: "https://api.flickr.com/services/feeds/BADREQUESTCODE")
        flickrDataProvider.provideData { response in
            XCTAssertNotNil(response.error)
            guard let _ = response.error as? InternetDataProviderError else {
                XCTAssert(false)
                return
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 25, handler: nil)
    }

}
