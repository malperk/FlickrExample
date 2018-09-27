//
//  MainViewController.swift
//  FlickrExample
//
//  Created by Alper KARATAS on 9/27/18.
//  Copyright © 2018 Alper KARATAS. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController {
    let reuseIdentifier = "ItemCell"
    var viewModel: HasItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Get items
        self.viewModel?.getItems(finished: { error in
            guard let _ = error else {
                // Reload collectionview on main thread
                DispatchQueue.main.async() {
                    self.collectionView.reloadData()
                }
                return
            }
        })
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.items.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCell
        guard let item = self.viewModel?.items[indexPath.row] else {
            return cell
        }
        cell.title.text = item.title
        cell.picture.downloaded(from: item.media.m)
        return cell
    }

}
