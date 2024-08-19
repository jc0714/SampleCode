//
//  ViewController.swift
//  tableView_sampleCode
//
//  Created by J oyce on 2024/8/17.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        //let cell = CustomTableViewCell(style: .default, reuseIdentifier: nil)

        cell.textLabel?.text = "Row \(indexPath.row)"

        if indexPath.row % 2 == 0 {
            cell.imageView?.image = UIImage(named: "George")
        } else {
            cell.imageView?.image = UIImage(named: "Sky")
        }

        cell.rowIndex = indexPath.row

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("willDisplay: Cell for row \(indexPath.row) will display")

        cell.alpha = 0
        let transform = CGAffineTransform(translationX: 0, y: 30)
        cell.transform = transform

        UIView.animate(withDuration: 0.5, delay: 0.05, options: .curveEaseInOut, animations: {
            cell.alpha = 1
            cell.transform = .identity
        })
    }

    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("didEndDisplaying: Cell for row \(indexPath.row) did end displaying")
    }
}

class CustomTableViewCell: UITableViewCell {
    private let highlightScale: CGFloat = 1.5 // 放大的比例
    var rowIndex : Int?

    // MARK: - Lifecycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib: Cell has been loaded from nib or storyboard")
        // 處理簡單的文字顏色、背景顏色等等
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        print("prepareForReuse: Cell is being prepared for reuse")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel?.textAlignment = .right
        print("layoutSubviews: Cell is laying out its subviews")
        // 調整佈局，頻繁使用
    }

    // MARK: - Selection Handling

    // 選擇，從按下到選取下一個之前
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.backgroundColor = selected ? .systemPink : .white
        // print("setSelected: Cell selection state changed to \(selected)")

        if let rowIndex = rowIndex {
            textLabel?.text = selected ? "你猜猜我代表什麼" : "Row \(rowIndex)"
        }

    }

    // 按住
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = highlighted ? .yellow : .white
        // print("setHighlighted: Cell highlight state changed to \(highlighted)")

        if highlighted {
            UIView.animate(withDuration: 0.2) {
                self.transform = CGAffineTransform(scaleX: self.highlightScale, y: self.highlightScale)
            }
        } 
        else {
            UIView.animate(withDuration: 0.2) {
                self.transform = CGAffineTransform.identity
            }
        }
    }

    // MARK: - Deinitialization

    deinit {
        print("deinit: Cell is being deallocated")
    }
}
