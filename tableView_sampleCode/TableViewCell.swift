//
//  TableViewCell.swift
//  tableView_sampleCode
//
//  Created by J oyce on 2024/8/17.
//
//
//import UIKit
//
//class CustomTableViewCell: UITableViewCell {
//
//    // MARK: - Initializers
//    
//    // 用程式碼寫 cell
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        print("Cell initialized with style: \(style.rawValue) and reuseIdentifier: \(reuseIdentifier ?? "nil")")
//    }
//
//    // 從 storyboard 或 nib 文件中載入 cell 時被調用
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        print("Cell initialized from nib/storyboard with coder")
//    }
//
//    // MARK: - Lifecycle Methods
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        print("awakeFromNib: Cell has been loaded from nib or storyboard")
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        print("prepareForReuse: Cell is being prepared for reuse")
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        print("layoutSubviews: Cell is laying out its subviews")
//    }
//
//    // MARK: - Selection Handling
//    
//    // 從按下到選取下一個之前
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        print("setSelected: Cell selection state changed to \(selected)")
//    }
//    
//    // 按下去
//    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
//         super.setHighlighted(highlighted, animated: animated)
//         print("setHighlighted: Cell highlight state changed to \(highlighted)")
//    }
//
//    // MARK: - Deinitialization
//
//    deinit {
//        print("deinit: Cell is being deallocated")
//    }
//}
//
