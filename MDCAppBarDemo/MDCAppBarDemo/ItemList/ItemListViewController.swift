//
//  ItemListViewController.swift
//  MDCAppBarDemo
//
//  Created by Nicolás Miari on 2019/09/24.
//  Copyright © 2019 Nicolás Miari. All rights reserved.
//

import UIKit

class ItemListViewController: UITableViewController {

    private var viewModel = ItemListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func done(_ sender: Any) {
        navigationController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else {
            fatalError("Storyboard Inconsistency")
        }
        cell.titleLabel.text = viewModel.item(at: indexPath.row)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.remove(at: indexPath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .left)
        tableView.endUpdates()
    }
}
