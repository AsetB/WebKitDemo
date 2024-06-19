//
//  PageLoadingTableViewCell.swift
//  WebviewDemo
//
//  Created by Aset Bakirov on 19.06.2024.
//

import UIKit
import SnapKit

class PageLoadingTableViewCell: UITableViewCell {
    //MARK: - Outlets
    lazy var pageName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    lazy var pageTime: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .blue
        return label
    }()

    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "pageloadCell")
        self.backgroundColor = .white
        self.selectedBackgroundView = {
            let view = UIView()
            view.backgroundColor = UIColor.clear
            return view
        }()
        setViews()
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Setup
    func setViews() {
        contentView.addSubview(pageName)
        contentView.addSubview(pageTime)
    }
    
    func setContraints() {
        pageName.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(8)
        }
        pageTime.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(8)
        }
    }
}
