//
//  String+Extensions.swift
//  MDCAppBarDemo
//
//  Created by Nicolás Miari on 2019/09/24.
//  Copyright © 2019 Nicolás Miari. All rights reserved.
//

import Foundation

extension String {

    static var loremIpsum: String = "Lorem ipsum dolor sit amet, consectetur " +
    "adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna " +
    "aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris " +
    "nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit " +
    "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint " +
    "occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim " +
    "id est laborum."

    static func loremIpsum(length: Int) -> String {
        if length > loremIpsum.count {
            return loremIpsum + " " + loremIpsum(length: length - loremIpsum.count)
        }
        return String(loremIpsum.prefix(length))
    }
}
