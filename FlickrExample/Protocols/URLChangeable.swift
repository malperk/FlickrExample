//
//  URLChangeable.swift
//  FlickrExample
//
//  Created by Alper KARATAS on 9/26/18.
//  Copyright © 2018 Alper KARATAS. All rights reserved.
//

import Foundation
// URLChangeable protocol Errors
enum URLChangeableError: Error {
    case invalidURL(url: URLChangeable)
}

// URLChangeable protocol
protocol URLChangeable {
    func toURL() throws -> URL
}

// String extension for the URLChangeable protocol
// Returns URLChangeableError if String is not valid
extension String: URLChangeable {
    func toURL() throws -> URL {
        guard let url = URL(string: self) else { throw URLChangeableError.invalidURL(url: self) }
        return url

    }
}
