//
//  MainViewController.swift
//  WebviewDemo
//
//  Created by Aset Bakirov on 19.06.2024.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    //MARK: - variables
    let buttonArray = ["Kaspi", "Jmart", "Halyk", "Wildberries", "Ozon", "OLX", "Белый Ветер", "Forte", "Satu", "Technodom", "Sulpak", "Mechta", "Alser"]
    var loadingTimes: [(name: String, time: TimeInterval)] = []
    //MARK: - Outlets
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите маркетплейс"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.contentMode = .scaleToFill
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    func setButtons() {
        for i in 0..<buttonArray.count {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(buttonArray[i], for: .normal)
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 10
            button.tag = i
            button.addTarget(self, action: #selector(generalButtonAction(_:)), for: .touchUpInside)
            contentView.addSubview(button)
            
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat(i) * 100), // Spacing for each button
                button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                button.widthAnchor.constraint(equalToConstant: 95),
                button.heightAnchor.constraint(equalToConstant: 56)
            ])
        }
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.register(PageLoadingTableViewCell.self, forCellReuseIdentifier: "pageloadCell")
        return tv
    }()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViews()
        setButtons()
        setConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    //MARK: - Setup
    private func setViews() {
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        view.addSubview(tableView)
    }
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(68)
        }
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalToConstant: CGFloat(buttonArray.count) * 100)
        ])
        tableView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    //MARK: - Button actions
    
    @objc func generalButtonAction(_ sender: UIButton) {
        let buttonIndex = sender.tag
        let buttonTitle = buttonArray[buttonIndex]
        
        switch buttonTitle {
        case "Kaspi":
            let vc = ViewController()
            vc.urlToOpen = .kaspi
            vc.loadingDelegate = self
            navigationController?.show(vc, sender: self)
        case "Jmart":
            let vc = ViewController()
            vc.urlToOpen = .jusan
            vc.loadingDelegate = self
            navigationController?.show(vc, sender: self)
        case "Halyk":
            let vc = ViewController()
            vc.urlToOpen = .halyk
            vc.loadingDelegate = self
            navigationController?.show(vc, sender: self)
        case "Wildberries":
            let vc = ViewController()
            vc.urlToOpen = .wild
            vc.loadingDelegate = self
            navigationController?.show(vc, sender: self)
        case "Ozon":
            let vc = ViewController()
            vc.urlToOpen = .ozon
            vc.loadingDelegate = self
            navigationController?.show(vc, sender: self)
        case "OLX":
            let vc = ViewController()
            vc.urlToOpen = .olx
            vc.loadingDelegate = self
            navigationController?.show(vc, sender: self)
        case "Белый Ветер":
            let vc = ViewController()
            vc.urlToOpen = .shopkz
            vc.loadingDelegate = self
            navigationController?.show(vc, sender: self)
        case "Satu":
            let vc = ViewController()
            vc.urlToOpen = .satu
            vc.loadingDelegate = self
            navigationController?.show(vc, sender: self)
        case "Technodom":
            let vc = ViewController()
            vc.urlToOpen = .technodom
            vc.loadingDelegate = self
            navigationController?.show(vc, sender: self)
        case "Sulpak":
            let vc = ViewController()
            vc.urlToOpen = .sulpak
            vc.loadingDelegate = self
            navigationController?.show(vc, sender: self)
        case "Mechta":
            let vc = ViewController()
            vc.urlToOpen = .mechta
            vc.loadingDelegate = self
            navigationController?.show(vc, sender: self)
        case "Alser":
            let vc = ViewController()
            vc.urlToOpen = .alser
            vc.loadingDelegate = self
            navigationController?.show(vc, sender: self)
        case "Forte":
            let vc = ViewController()
            vc.urlToOpen = .forte
            vc.loadingDelegate = self
            navigationController?.show(vc, sender: self)
        default:
            break
        }
    }
}

extension MainViewController: PageLoading {
    func didFinishLoading(page: String, loadingTime: TimeInterval) {
        let marketplaceName = page
        loadingTimes.append((name: marketplaceName, time: loadingTime))
        loadingTimes.sort { $0.time < $1.time }
        tableView.reloadData()
    }
    
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadingTimes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pageloadCell", for: indexPath) as! PageLoadingTableViewCell
        let loadingInfo =  loadingTimes[indexPath.row]
        cell.pageName.text = loadingInfo.name
        cell.pageTime.text = String(format: "%.2f секунд", loadingInfo.time)
        return cell
    }
    
    
}


