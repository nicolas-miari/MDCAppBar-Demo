//
//  ItemListViewModel.swift
//  MDCAppBarDemo
//
//  Created by Nicolás Miari on 2019/09/24.
//  Copyright © 2019 Nicolás Miari. All rights reserved.
//

import Foundation

class ItemListViewModel {

    private var items: [String] = []

    init() {
        let minLength = 20
        let maxLength = 500
        let itemCount = 100

        for _ in 0 ..< itemCount {
            let length = Int.random(in: minLength ... maxLength)
            items.append(String.loremIpsum(length: length))
        }
    }

    var numberOfRows: Int {
        return items.count
    }

    func item(at row: Int) -> String {
        return items[row]
    }

    func remove(at row: Int) {
        items.remove(at: row)
    }
}
