//
//  ThirdPageVC.swift
//  tableView_sampleCode
//
//  Created by J oyce on 2024/8/17.
//

import UIKit

class ThirdPageVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
    var selectedRows: Set<Int> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(ThreeTableViewCell.self, forCellReuseIdentifier: "Cell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"

        // 確認這個 index 是否需要被被勾起來

//        if selectedRows.contains(indexPath.row) {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // 1. 對這個 cell 實例作處理，在 reuse 的時候可能會不乾淨

        let cell = tableView.cellForRow(at: indexPath)

        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }

        tableView.deselectRow(at: indexPath, animated: true)


        // 2. 用 selectedRows set 來管理被勾起來的 row，重新觸發 cellForRowAt 來配置。如果需要更新很多部分，那可以選擇這個方式。
//
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        if selectedRows.contains(indexPath.row) {
//            selectedRows.remove(indexPath.row)
//        } else {
//            selectedRows.insert(indexPath.row)
//        }
//
//        tableView.reloadRows(at: [indexPath], with: .automatic)

        // 3. 抓出特定 cell，更新 accessoryType 的部分

//        let cell = tableView.cellForRow(at: indexPath)
//
//        if selectedRows.contains(indexPath.row) {
//            selectedRows.remove(indexPath.row)
//            cell?.accessoryType = .none
//        } else {
//            selectedRows.insert(indexPath.row)
//            cell?.accessoryType = .checkmark
//        }
//
//        tableView.deselectRow(at: indexPath, animated: true)
    }
}

class ThreeTableViewCell: UITableViewCell {
}
