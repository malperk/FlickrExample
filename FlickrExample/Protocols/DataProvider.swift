//
//  DataProvider.swift
//  FlickrExample
//
//  Created by Alper KARATAS on 9/26/18.
//  Copyright © 2018 Alper KARATAS. All rights reserved.
//

import Foundation

// DataProvider typealias for response
typealias DataProviderResponse = (data: Data?, error: Error?)
// DataProvider typealias for response closure
typealias CompletionClosure = (DataProviderResponse) -> Void

// DataProvider protocol
protocol DataProvider {
    func provideData(completion: @escaping CompletionClosure)
}
