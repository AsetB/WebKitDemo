//
//  PageLoading.swift
//  WebviewDemo
//
//  Created by Aset Bakirov on 19.06.2024.
//

import Foundation

protocol PageLoading: AnyObject {
    func didFinishLoading(page: String, loadingTime: TimeInterval)
}
