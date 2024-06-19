//
//  URLs.swift
//  WebviewDemo
//
//  Created by Aset Bakirov on 19.06.2024.
//

import Foundation

enum URLs: String {
    case base = "https://google.kz"
    case kaspi = "https://kaspi.kz/shop/c/smartphones/?q=%3Acategory%3ASmartphones%3AavailableInZones%3AMagnum_ZONE1&sort=relevance&sc="
    case jusan = "https://jmart.kz/products?category_id=370"
    case halyk = "https://halykmarket.kz/category/telefoni"
    case wild = "https://global.wildberries.ru/catalog?category=9463"
    case ozon = "https://ozon.kz/category/smartfony-15502/"
    case olx = "https://www.olx.kz/elektronika/telefony-i-aksesuary/mobilnye-telefony-smartfony/"
    case shopkz = "https://shop.kz/almaty/offers/smartfony/"
    case forte = "https://market.forte.kz/categories/smartfony-1135"
    case satu = "https://satu.kz/Mobilnye-telefony"
    case technodom = "https://www.technodom.kz/catalog/smartfony-i-gadzhety"
    case sulpak = "https://www.sulpak.kz/f/smartfoniy"
    case mechta = "https://www.mechta.kz/section/telefony-eed/"
    case alser = "https://alser.kz/c/smartfony"
    
    var domain: String {
        guard let url = URL(string: self.rawValue),
              var host = url.host() else {
            return ""
        }
        if host.hasPrefix("www.") {
            host = String(host.dropFirst(4))
        }
        return host
    }
}
