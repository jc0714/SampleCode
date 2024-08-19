//
//  ThirdPageVC.swift
//  tableView_sampleCode
//
//  Created by J oyce on 2024/8/17.
//

import UIKit

class SecondPageVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
    var selectedRows: Set<Int> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(SecondTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SecondTableViewCell

        cell.textLabel?.text = "Row \(indexPath.row)"

        if selectedRows.contains(indexPath.row) {
            cell.accessoryType = .checkmark
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if selectedRows.contains(indexPath.row) {
            selectedRows.remove(indexPath.row)
        } else {
            selectedRows.insert(indexPath.row)
        }

        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

class SecondTableViewCell: UITableViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
}
