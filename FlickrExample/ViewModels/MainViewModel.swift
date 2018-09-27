//
//  MainViewModel.swift
//  FlickrExample
//
//  Created by Alper KARATAS on 9/27/18.
//  Copyright © 2018 Alper KARATAS. All rights reserved.
//

import Foundation

class MainViewModel: HasItem {
    var items: [Item] = []
    let dataProvider: DataProvider

    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }
    func getItems(finished: @escaping (Error?) -> Void) {
        self.dataProvider.provideData { response in
            guard let flickrData = response.data else {
                finished(response.error)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let flickrFeed = try decoder.decode(FlickrFeed.self, from: flickrData)
                self.items = flickrFeed.items
                finished(nil)
            } catch {
                finished(error)
            }
        }
    }
}
