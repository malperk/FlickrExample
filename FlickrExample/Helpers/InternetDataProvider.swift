//
//  InternetDataProvider.swift
//  FlickrExample
//
//  Created by Alper KARATAS on 9/26/18.
//  Copyright © 2018 Alper KARATAS. All rights reserved.
//

import Foundation

// Acceptable response codes
let acceptableResponseCodes = [200]

// Internet Data Provider Errors
enum InternetDataProviderError: Error {
    case invalidStatusCode(statusCode: Int)
    case noResponse()
}

// HTTP Request Methods
public enum HTTPRequestMethod: String {
    case get = "GET"
    case post = "POST"
}

// Internet Data Provider
class InternetDataProvider: DataProvider {
    private let urlString: URLChangeable
    private let method: HTTPRequestMethod
    init(urlString: URLChangeable, method: HTTPRequestMethod = HTTPRequestMethod.get) {
        self.urlString = urlString
        self.method = method
    }
    // Protocol method that provides data
    func provideData(completion: @escaping CompletionClosure) {
        do {
            let url = try self.urlString.toURL()
            var request = URLRequest(url: url)
            request.httpMethod = self.method.rawValue
            makeRequest(request: request, completion: completion)
        } catch {
            let response = DataProviderResponse(nil, error)
            completion(response)
        }
    }
    // Private method that makes url request
    private func makeRequest(request: URLRequest, completion: @escaping CompletionClosure) {
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                let response = DataProviderResponse(nil, error)
                completion(response)
                return
            }
            guard let urlResponse = response as? HTTPURLResponse else {
                let response = DataProviderResponse(nil, InternetDataProviderError.noResponse())
                completion(response)
                return
            }
            guard acceptableResponseCodes.contains(urlResponse.statusCode) else {
                let response = DataProviderResponse(nil, InternetDataProviderError.invalidStatusCode(statusCode: urlResponse.statusCode))
                completion(response)
                return
            }
            let response = DataProviderResponse(data, nil)
            completion(response)
        }.resume()
    }
}
