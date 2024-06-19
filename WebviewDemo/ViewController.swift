//
//  ViewController.swift
//  WebviewDemo
//
//  Created by Aset Bakirov on 19.06.2024.
//

import UIKit
import WebKit
import SnapKit

class ViewController: UIViewController, WKNavigationDelegate {
    //MARK: - Variables
    weak var loadingDelegate: PageLoading?
    var domainName: String = ""
    var urlToOpen: URLs = .base
    var startTime: Date?
    //MARK: - Outlets
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViews()
        setConstraints()
        setNavAppearance()
        setWebView(url: urlToOpen)
        domainName = urlToOpen.domain
    }
    //MARK: - Setup
    private func setNavAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }
    
    private func setViews() {
        view.addSubview(webView)
    }
    
    private func setConstraints() {
        webView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    //MARK: - WebView
    func setWebView(url: URLs) {
        guard let url = URL(string: url.rawValue) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        startTime = Date()
        self.navigationItem.title = "Загружаем..."
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let startTime = startTime else { return }
        let loadingTime = Date().timeIntervalSince(startTime)
        self.navigationItem.title = String(format: "Время загрузки: %.2f секунд", loadingTime)
        loadingDelegate?.didFinishLoading(page: domainName, loadingTime: loadingTime)
    }
}

