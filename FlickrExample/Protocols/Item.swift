//
//  ItemProtocol.swift
//  FlickrExample
//
//  Created by Alper KARATAS on 9/27/18.
//  Copyright © 2018 Alper KARATAS. All rights reserved.
//

import Foundation

protocol HasItem {
    var items: [Item] { get }
    func getItems(finished: @escaping (Error?) -> Void)
}
