//
//  TableViewController.swift
//  MDCAppBarDemo
//
//  Created by Nicolás Miari on 2019/09/24.
//  Copyright © 2019 Nicolás Miari. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialAppBar

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.row {
        case 0:
            presentStockNavigation()

        case 1:
            presentMaterialNavigation()

        default:
            fatalError("Storyboard Inconsistency: There should be only 2 rows, tapped on row at index #\(indexPath.row) out of bounds.")
        }
    }

    // MARK: -

    private func presentStockNavigation() {
        let navigation = UINavigationController(navigationBarClass: nil, toolbarClass: nil)
        navigation.delegate = self
        navigation.navigationBar.barStyle = .black
        navigation.navigationBar.isTranslucent = false
        navigation.navigationBar.tintColor = .white
        navigation.navigationBar.barTintColor = .blue

        let content = newList()
        navigation.pushViewController(content, animated: false)

        present(navigation, animated: true, completion: nil)
    }

    private func presentMaterialNavigation() {
        let navigation = MDCAppBarNavigationController()
        navigation.delegate = self

        let content = newList()
        navigation.pushViewController(content, animated: false)

        present(navigation, animated: true, completion: nil)
    }

    private func newList() -> UIViewController {
        let storyboard = UIStoryboard(name: "ItemList", bundle: nil)
        guard let itemListViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Storyboard Inconsistency Failed to instantiate initial view controller (ItemList).")
        }
        return itemListViewController
    }
}

// MARK: - MDCAppBarNavigationControllerDelegate

extension MainTableViewController: MDCAppBarNavigationControllerDelegate {

    func appBarNavigationController(
        _ navigationController: MDCAppBarNavigationController,
        willAdd appBar: MDCAppBar,
        asChildOf viewController: UIViewController) {

        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .left

        appBar.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.paragraphStyle: paragraph
        ]
        appBar.navigationBar.tintColor = .white
        appBar.headerViewController.headerView.backgroundColor = .blue
    }
}
