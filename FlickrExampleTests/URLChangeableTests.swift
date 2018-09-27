//
//  URLChangeableTests.swift
//  FlickrExampleTests
//
//  Created by Alper KARATAS on 9/26/18.
//  Copyright © 2018 Alper KARATAS. All rights reserved.
//

import XCTest

class URLChangeableTests: XCTestCase {
    func testNormalURL(){
        let urlString = "http://example.com"
        do {
            let _ = try urlString.toURL()
        } catch {
            XCTAssert(false)
        }
    }
    func testBadURL(){
        let urlString = "http://example.comÖ"
        do {
            let _ = try urlString.toURL()
             XCTAssert(false)
        } catch {
        }
    }

}
