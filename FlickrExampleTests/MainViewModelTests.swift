//
//  MainViewModelTests.swift
//  FlickrExampleTests
//
//  Created by Alper KARATAS on 9/27/18.
//  Copyright © 2018 Alper KARATAS. All rights reserved.
//

import XCTest

class MainViewModelTests: XCTestCase {
    func testInitialDefaults() {
        let viewModel = MainViewModel(dataProvider: InternetDataProvider(urlString: URLs.flickrURL))
        XCTAssertEqual(0, viewModel.items.count)
    }
    func testGetItemsSuccess() {
        let expectation = self.expectation(description: "testGetItems")
        let viewModel = MainViewModel(dataProvider: InternetDataProvider(urlString: URLs.flickrURL))
        viewModel.getItems { error in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    func testGetItemsFail() {
        let expectation = self.expectation(description: "testGetItemsFail")
        let viewModel = MainViewModel(dataProvider: InternetDataProvider(urlString: "FAIL"))
        viewModel.getItems { error in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}
